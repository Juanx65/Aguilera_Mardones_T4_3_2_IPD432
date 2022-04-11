from serial import Serial
from random import randint
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

    def sendVector(self, vector):
        for element in vector:
            self.serial.write((str(element) + "\n").encode('ascii'))
            time.sleep(0.01)

    def recieveResult(self):

        line = self.serial.readline().decode('ascii')


        while (line == None or line == "\n"):
            time.sleep(0.2)
        y_sqrt = line.strip().split(":")[1]
        return float(y_sqrt)

    def generateVecs(self):
        res = 0

        self.vectorA = []
        self.vectorB = []

        for i in range(self.vectorSize):
            randA = randint(0,255)
            randB = randint(0,255)

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

        for tst in range(self.tests):
            self.generateVecs()
            self.sendVector(self.vectorConcat)
            y_sqrt  = self.recieveResult()

            res_err = 100*abs((y_sqrt - self.expected)/self.expected)

            print("TRIAL", tst+1, "HARDWARE RESULT:", y_sqrt, "\t SOFTWARE RESULT: ", round(self.expected,4), end="")


            if (res_err > 1):
                result+=1
                print(" TRIAL FAILED")
            else:
                print(" TRIAL PASS")
            
                


        return result


if __name__ == "__main__":
    zynqDev = zynqTest('/dev/ttyUSB1', 115200, 128, 10)

    print("Listening...")


    zynqDev.generateVecs()

    print(zynqDev.vectorA)
    print(zynqDev.vectorB)

    res = zynqDev.runTest()

    percent = 100*res/zynqDev.tests
    
    if percent > 90:
        print(50*"*")
        print("*" + 22 * "", str(percent) + "%  TRIALS FAILED" + 22*"" + "*")
        print(50*"*")
    else:
        print(50*"*")
        print("*" + 22 * "", str(100- percent) + "% TRIALS PASSED" + 22*"" + "*")
        print(50*"*")
    

   # zynqDev.closeSerial()