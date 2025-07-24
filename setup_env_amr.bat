@echo off
SETLOCAL

echo [1/6] create env Python 3.8...
py -3.8 -m venv env38

echo [2/6] Active enviroment
call env38\Scripts\activate

echo [3/6] Install pip, setuptools, cython, numpy (version binary for prevent error build)...
pip install --upgrade pip
pip install setuptools wheel cython
pip install numpy==1.23.5 --only-binary=:all:

echo [4/6] Install fairseq from GitHub...
pip install git+https://github.com/pytorch/fairseq.git@v0.10.2


echo [5/6] Install lib from requirements.txt...
pip install -r requirements.txt


pip install transition-neural-parser

@REM for GPU using
@REM pip install torch-scatter -f https://data.pyg.org/whl/torch-1.13.1+cu117.html

@REM for CPU using
pip install torch-scatter -f https://data.pyg.org/whl/torch-1.13.1+cpu.html


echo [6/6] Done install libs
echo Enviroment name: env38
echo Type "call env38\Scripts\activate" for using

ENDLOCAL
pause
