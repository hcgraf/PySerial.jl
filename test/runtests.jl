using PySerial
using Base.Test

@test typeof(list_ports()) == Array{Any,1}
