<h1 align="center"> 16bit-MIPS-processor :desktop_computer:</h1>

## Instruction Set Architecture:

<table align="center">
    <tr>
        <th>Type</th>
        <th>Instruction</th>
        <th>Abbrv.</th>
        <th>Example</th>
        <th>Opcode</th>
        <th>function extend</th>
    </tr>
    <tr>
        <td rowspan='14'> R-type</td>
        <td>Addition</td>
        <td>add</td>
        <td>add rd, rs, rt</td>
        <td>000</td>
        <td>0000</td>
    </tr>
    <tr>
        <td>Subtraction</td>
        <td>sub</td>
        <td>sub rd, rs, rt</td>
        <td>000</td>
        <td>0001</td>
    </tr>
    <tr>
        <td>Multiplication</td>
        <td>mult</td>
        <td>mult rd, rs, rt</td>
        <td>000</td>
        <td>0010</td>
    </tr>
    <tr>
        <td>Division</td>
        <td>div</td>
        <td>div rd, rs, rt</td>
        <td>000</td>
        <td>0011</td>
    </tr>
    <tr>
        <td>Logical AND</td>
        <td>and</td>
        <td>and rd, rs, rt</td>
        <td>000</td>
        <td>0100</td>
    </tr>
    <tr>
        <td>Logical OR</td>
        <td>or</td>
        <td>or rd, rs, rt</td>
        <td>000</td>
        <td>0101</td>
    </tr>
    <tr>
        <td>Logical NOT</td>
        <td>not</td>
        <td>not rd, rs</td>
        <td>000</td>
        <td>0110</td>
    </tr>
    <tr>
        <td>Bitwise AND</td>
        <td>band</td>
        <td>band rd, rs, rt</td>
        <td>000</td>
        <td>0111</td>
    </tr>
    <tr>
        <td>Bitwise OR</td>
        <td>bor</td>
        <td>bor rd, rs, rt</td>
        <td>000</td>
        <td>1000</td>
    </tr>
    <tr>
        <td>Bitwise Complement</td>
        <td>bnot</td>
        <td>bnot rd, rs</td>
        <td>000</td>
        <td>1001</td>
    </tr>
    <tr>
        <td>Logical left shift</td>
        <td>lls</td>
        <td>lls rd, rs</td>
        <td>000</td>
        <td>1010</td>
    </tr>
    <tr>
        <td>Logical right shift</td>
        <td>lrs</td>
        <td>lrs rd, rs</td>
        <td>000</td>
        <td>1011</td>
    </tr>
    <tr>
        <td>Set less than</td>
        <td>slt</td>
        <td>slt rd, rs, rt</td>
        <td>000</td>
        <td>1100</td>
    </tr>
    <tr>
        <td>Jump register</td>
        <td>jr</td>
        <td>jr rs</td>
        <td>000</td>
        <td>1101</td>
    </tr>
    <tr>
        <td rowspan='4'> I-type</td>
        <td>Load</td>
        <td>lw</td>
        <td>lw rd, #(rs)</td>
        <td>001</td>
        <td>xxxx</td>
    </tr>
    <tr>
        <td>Store</td>
        <td>sw</td>
        <td>sw rd, #(rs)</td>
        <td>010</td>
        <td>xxxx</td>
    </tr>
    <tr>
        <td>Branch if equal</td>
        <td>beq</td>
        <td>beq rs, rt, label</td>
        <td>011</td>
        <td>xxxx</td>
    </tr>
    <tr>
        <td>Add immediate</td>
        <td>addi</td>
        <td>addi rd, rs, immediate</td>
        <td>100</td>
        <td>xxxx</td>
    </tr>
    <tr>
        <td rowspan='3'> J-type</td>
        <td>Jump</td>
        <td>jmp</td>
        <td>jmp label</td>
        <td>101</td>
        <td>xxxx</td>
    </tr>
    <tr>
        <td>Jump and Link</td>
        <td>jal</td>
        <td>jal label</td>
        <td>110</td>
        <td>xxxx</td>
    </tr>
    <tr>
        <td>HALT</td>
        <td>HALT</td>
        <td>HALT_RST</td>
        <td>111</td>
        <td>xxxx</td>
    </tr>
</table>
