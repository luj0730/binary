#coding:utf-8


def convert():
    try:
        f = open('install.sh', 'r')
        f2 = open('docker.sh', 'w')
        for i in f.readlines():
            if len(i) > 1:
                print(str(i))
                f2.write('RUN ' + str(i))
            else:
                pass
        f.close()
        f2.close()
    except Exception as e:
        print(str(e))
        pass

if __name__ == '__main__':
    convert()