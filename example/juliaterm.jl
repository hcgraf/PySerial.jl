#!/usr/bin/julia

println("""
WARNING: this is just a proof of concept, not a fully featured terminal application!
         TTY->serial works only per line (instead of per character)

""")
println("Compiling, please wait…")
using PySerial

function serial2tty(s)
  while true
   w = inWaiting(ser)
   if w > 0
     s = read(ser,w)
     print(s)
   end
   sleep(0.001)
  end
end

function tty2serial(s)
  while !eof(STDIN)
    c = read(STDIN, Uint8) # it seems to be buffered until newline, that's not so good for a general terminal application, but ok...
    write(s,[c])
  end
end

port = length(ARGS) > 0 ? ARGS[1] : "/dev/ttyUSB0"
baudrate = length(ARGS) > 1 ? int(ARGS[2]) : 9600

ser = Serial(port, baudrate=baudrate)
println("== Welcome to juliaterm.jl! Port: $port, baudrate: $baudrate ==")

@async serial2tty(ser)
tty2serial(ser)

