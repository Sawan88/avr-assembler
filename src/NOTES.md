## Configure PORTB and PORTD for output

```asm
.DEVICE ATtiny2313A

SER r16 ; set 0xff
OUT $11,r16
OUT $17,r16
```
