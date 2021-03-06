typeI = {
    'addi': { 'opcode': '001000', 'format': ['rt','rs','immediate'],
        'defaults': {} },
    'addiu': { 'opcode': '001001', 'format': ['rt', 'rs', 'immediate'],
        'defaults': {} },
    'lui': { 'opcode': '001111', 'format': ['rt','immediate'],
        'defaults': {} },
    'andi': { 'opcode': '001100', 'format': ['rt','rs','immediate'],
        'defaults': {} },
    'ori': { 'opcode': '001101', 'format': ['rt','rs','immediate'],
        'defaults': {} },
    'xori': { 'opcode': '001110', 'format': ['rt', 'rs', 'immediate'],
        'defaults': {} },
    'bgez': { 'opcode': '000001', 'format': ['rs','immediate'],
        'defaults': { 'rt': '00001'} },
    'bltz': { 'opcode': '000001', 'format': ['rs', 'immediate'],
        'defaults': { 'rt': '00000'} },
    'beq': { 'opcode': '000100', 'format': ['rt','rs', 'immediate'],
        'defaults': {} },
    'bne': { 'opcode': '000101', 'format': ['rt','rs', 'immediate'],
        'defaults': {} },
    'lb': { 'opcode': '100000', 'format': ['rt','immediate', 'rs'],
        'defaults': {} },
    'lw': { 'opcode': '100011', 'format': ['rt','immediate','rs'],
        'defaults': {} },
    'sb': { 'opcode': '101000', 'format': ['rt','immediate','rs'],
        'defaults': {} },
    'sw': { 'opcode': '101011', 'format': ['rt','immediate','rs'],
        'defaults': {} },
    'lh': { 'opcode': '100001', 'format': ['rt','immediate','rs'],
        'defaults': {} },
    'sh': { 'opcode': '101001', 'format': ['rt','immediate','rs'],
        'defaults': {} },
    'slti': { 'opcode': '001010', 'format': ['rt','rs','immediate'],
        'defaults': {} },
    'sltiu': { 'opcode': '001011', 'format': ['rt','rs','immediate'],
        'defaults': {} }
}
