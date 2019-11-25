#####################
#####   masm    #####
#####################
# Masm32Dir=D:\masm32
# include=%Masm32Dir%\Include;
# lib=%Masm32Dir%\lib;
# path=%Masm32Dir%\Bin;%Masm32Dir%;

# ml.exe /c hello.asm
# link16 hello.obj

echo "
#####################
#####   nasm    #####
#####################
"

tee first.asm <<-'EOF'
global main

main:
mov eax, 0
ret
EOF

cp /etc/apt/sources.list /etc/apt/sources.list.bak \
    && sed -i 's/security.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list \
    && sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y apt-transport-https vim \
    && apt-get install -y gcc nasm vim gcc-multilib \
    && chmod 755 first.asm \
    && nasm -f elf first.asm -o first.o \
    && gcc -m32 first.o -o first \
    && echo "exec elf..." \
    && ./first
    
