module PySerial

export list_ports, Serial, open, close, read, write, 
       inWaiting, flush, flushInput, flushOutput

using PyCall

# import Base, so that existing functions are overloaded correctly
import Base: open, close, read, write, flush

@pyimport serial
@pyimport serial.tools.list_ports as lp

list_ports() = lp.comports()

Serial(args...; kwargs...) = serial.Serial(args...; kwargs...)

open(s::PyObject) = s[:open]()
close(s::PyObject) = s[:close]()

read(s::PyObject, size::Int = 1) = s[:read](size)
write(s::PyObject, data) = s[:write](data)

inWaiting(s::PyObject) = s[:inWaiting]()

flush(s::PyObject) = s[:flush]()
flushInput(s::PyObject) = s[:flushInput]()
flushOutput(s::PyObject) = s[:flushOutput]()

end # module
