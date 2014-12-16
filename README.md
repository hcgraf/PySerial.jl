# PySerial

Small wrapper module for using the great Python PySerial module (<http://pyserial.sourceforge.net/>) from Julia with the help of PyCall (<https://github.com/stevengj/PyCall.jl>).

## Usage

Example usage:

    using PySerial
    
    # construct a serial port object
    # positional and keyword arguments can be used just like in the python module
    ser = Serial("/dev/ttyUSB0", baudrate=19200) 
    
    # read all the waiting characters and output them on the terminal
    w = inWaiting(ser)
    if w > 0
      s = read(ser,w)
      print(s)
    end
    
    # close the serial port
    close(ser)

Also have a look at the minimal terminal example in the examples/ folder.
