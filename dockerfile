FROM stefanscherer/python-windows
SHELL ["powershell.exe","-command"]
WORKDIR c:/App

#host the volume for output
VOLUME C:/Logs

#install the files
RUN pip install speedtest-cli


ENV logfileName=speedtest.csv

#COPY the runtime commands
COPY . .

#run the commands
ENTRYPOINT C:/App/CMD.ps1