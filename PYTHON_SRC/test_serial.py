from serial import Serial
from random import randint
import struct
import time

class zynqTest():
    def __init__(self, port='COM8', baudrate=115200, vectorSize=128 ,tests=1):
        self.serial = Serial(port = port,baudrate = baudrate)
        self.expected = 0
        self.vectorA  = []
        self.vectorB = []
        self.vectorConcat = []
        self.tests = tests
        self.vectorSize = vectorSize
        self.avgError = 0
        

    def sendVector(self, vector):
        for element in vector:
            self.serial.write((str(element) + "\n").encode('ascii'))
            time.sleep(0.01)
            


    def sendCommand(self,element):        
        self.serial.write((str(element) + "\n").encode('ascii'))

    def recieveResult(self):
        
        line = self.serial.readline().decode('ascii')        
        while (line == None or line == "\n"):
            time.sleep(0.01)        
        y_sqrt = line.strip()
        
        line = self.serial.readline().decode('ascii')
        while (line == None or line == "\n"):
            time.sleep(0.01)  
        y_sqrt_sw = line.strip()
        return float(y_sqrt), float(y_sqrt_sw)

    def generateVecs(self):
        res = 0

        self.vectorA = []
        self.vectorB = []

        for i in range(self.vectorSize):

            randA = randint(0,254)
            randB = randint(0,254)

            self.vectorA.append(randA)
            self.vectorB.append(randB)

            res += (randA - randB)**2

        self.expected = res**0.5

        self.vectorConcat = self.vectorA + self.vectorB

    def closeSerial(self):
        self.serial.close()
        self.serial = None

    def runTest(self):

        result = 0
        
        errors = []
        
        for tst in range(self.tests):
            
            try:
                y_sqrt, y_sqrt_sw = self.recieveResult()
                zynqDev.sendCommand(1)
                
            except:
                sleep(1)
                print("\n COMUNICATION ERROR \n")
                zynqDev.sendCommand(2)
                sleep(1)
                
            

            error = abs(y_sqrt - y_sqrt_sw)
            res_err = 100*error/y_sqrt_sw

            errors.append(error)
            
            

                    
            spaces = (43 - (len("TRIAL") + len(str(tst+1)) + len("HARDWARE RESULT:")))//2*" "
            print("TRIAL", tst+1, "HARDWARE RESULT:", y_sqrt, spaces,"SOFTWARE RESULT: ", y_sqrt_sw, end = "") #"\t SOFTWARE RESULT: ", round(self.expected,4), end="")
            if (res_err > 1):
                result+=1
                print(" TRIAL FAILED")
            else:
                print(" TRIAL PASS")

        self.avgError =  sum(errors)/len(errors)
        
        
        return result


if __name__ == "__main__":

    N_tests = int(input("Tests: "))
    
    zynqDev = zynqTest('COM13', 115200, 1024, N_tests)

    zynqDev.sendCommand(N_tests)
    
    print("")
    

    
    
    while(1):
        
        
        
        command = input("SEND 1 TO INSTANCE "+ str(zynqDev.tests) + "  TRIALS OF SoC BEHAVIOR OR 0 FINISH TEST: ") 
        
        if command == "1":
            print("")
            zynqDev.sendCommand(command)        
            res = zynqDev.runTest()

            percent = 100*res/zynqDev.tests

            if percent > 90:
                print(50*"*")
                print("*" + 22 * "", str(percent) + "%  TRIALS FAILED" + 22*"" + "*")
                print("* AVERAGE ERROR:", zynqDev.avgError, "*" )
                print(50*"*")
            else:
                print(50*"*")
                print("*" + 22 * "", str(100- percent) + "% TRIALS PASSED" + 22*"" + "*")
                print("* AVERAGE ERROR:", zynqDev.avgError, "*" )
                print(50*"*")
            
        else:
            break


            
            print()
    print("TEST FINISHED")            
   # zynqDev.closeSerial()
