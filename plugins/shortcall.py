from annotation.annotation import annotation
from block.base import Block
from block.code import CodeBlock
from romInfo import RomInfo
from annotation.simple import JumpTable

@annotation(priority=90)
def shortcall(memory, addr):
    ShortCallCodeBlock(memory, addr)

# I'm not sure what the shortcall does exactly yet,
# but it is followed by 1 byte indicating following things:
#   high nibble, bank number.
#   low nibble, which function to call
#   low nibble msb, not sure, something special.
class ShortCallCodeBlock(CodeBlock):
    def onCall(self, from_memory, from_address, next_addr):
        assert from_memory.byte(from_address) == 0xDF # RST 18
        index = from_memory.byte(next_addr)
        if index == 5:
            JumpTable(from_memory, next_addr + 1)
        else:
            CodeBlock(from_memory, next_addr + 1)
        return True # no return
