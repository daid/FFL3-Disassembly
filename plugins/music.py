from annotation.annotation import annotation
from annotation.simple import DataBlock, JumpTable
from block.base import Block
from block.gfx import GfxBlock
from block.code import CodeBlock
from romInfo import RomInfo


@annotation
def music_pointers(memory, addr, *, amount):
    MusicPointerBlock(memory, addr, amount=int(amount))
    for k, v in OPCODES.items():
        params = ""
        for idx, param in enumerate(v[1:]):
            if PARAM_SIZE[param] == 1:
                params += f"\ndb \{idx+1}"
            elif PARAM_SIZE[param] == 2:
                params += f"\ndw \{idx+1}"
        RomInfo.macros[v[0]] = f"db ${(k&0xFF):02x}" + params
    for n in range(16):
        for k, v in NOTES.items():
            RomInfo.macros[f"{v}_{n}"] = f"db ${k | n:02x}"


class MusicPointerBlock(Block):
    def __init__(self, memory, addr, *, amount):
        super().__init__(memory, addr, size=amount*8)

        for song_nr in range(amount):
            print("---- Song: " + str(song_nr) + " ----")
            for channel_nr in range(4):
                pointer = memory.word(addr + song_nr * 8 + channel_nr * 2)
                if memory.getLabel(pointer) is None:
                    memory.addLabel(pointer, f"song{song_nr:02x}_channel{[2,1,3,4][channel_nr]}")
                MusicBlock(memory, pointer, channel_nr=channel_nr)

    def export(self, file):
        for n in range(len(self) // 8):
            pointer2 = self.memory.word(file.addr)
            pointer1 = self.memory.word(file.addr + 2)
            pointer3 = self.memory.word(file.addr + 4)
            pointer4 = self.memory.word(file.addr + 6)
            
            label2 = self.memory.getLabel(pointer2)
            label1 = self.memory.getLabel(pointer1)
            label3 = self.memory.getLabel(pointer3)
            label4 = self.memory.getLabel(pointer4)
            file.asmLine(8, "dw", str(label2), str(label1), str(label3), str(label4))

OPCODES = {
    0xE0: ("mOCTAVE_0", ),
    0xE1: ("mOCTAVE_1", ),
    0xE2: ("mOCTAVE_2", ),
    0xE3: ("mOCTAVE_3", ),
    0xE4: ("mOCTAVE_4", ),
    0xE5: ("mOCTAVE_5", ),
    0xE6: ("mOCTAVE_6", ),
    0xE7: ("mOCTAVE_7", ),
    0xE8: ("mOCTAVE_PLUS_1", ),
    0xE9: ("mOCTAVE_PLUS_2", ),
    0xEA: ("mOCTAVE_PLUS_3", ),
    0xEB: ("mOCTAVE_PLUS_4", ),
    0xEC: ("mOCTAVE_MINUS_1", ),
    0xED: ("mOCTAVE_MINUS_2", ),
    0xEE: ("mOCTAVE_MINUS_3", ),
    0xEF: ("mOCTAVE_MINUS_4", ),
    0xF0: ("mVOLUME_ENVELOPE", "ptr"),
    0x3F0: ("mVOLUME", "byte"), # Special exception for channel 3 E0
    0xF1: ("mJUMP", "mptr"),
    0xF2: ("mREPEAT", "mptr"),
    0xF3: ("mCOUNTER", "byte"),
    0xF4: ("mVIBRATO", "ptr"),
    0xF5: ("mDUTYCYCLE", "byte"),
    0xF6: ("mSTEREOPAN", "byte"),
    0xF7: ("mTEMPO", "byte"),
    0xF8: ("mWAVETABLE", "ptr"),
    0xF9: ("mREPEAT_2", "mptr"),
    0xFA: ("mCOUNTER_2", "byte"),
    0xFB: ("mJUMPIF", "byte", "mptr"),
    0xFD: ("mUNK_ED", "byte"),
    0x1FE: ("mINIT1", "ptr", "ptr", "byte", "byte"),
    0x2FE: ("mINIT2", "byte", "ptr", "ptr", "byte", "byte"),
    0x3FE: ("mINIT3", "ptr", "byte", "ptr", "byte"),
    0xFF: ("mEND", )
}
PARAM_SIZE = {"byte": 1, "ptr": 2, "mptr": 2}

NOTES = {
    0x00: ("mC"),
    0x10: ("mCis"),
    0x20: ("mD"),
    0x30: ("mDis"),
    0x40: ("mE"),
    0x50: ("mF"),
    0x60: ("mFis"),
    0x70: ("mG"),
    0x80: ("mGis"),
    0x90: ("mA"),
    0xA0: ("mAis"),
    0xB0: ("mB"),
    0xC0: ("mWait"),
    0xD0: ("mRest"),
}

class MusicBlock(Block):
    def __init__(self, memory, addr, *, channel_nr):
        super().__init__(memory, addr)
        self.channel_nr = channel_nr

        while True:
            if memory[addr + len(self)] is not None:
                break
            size = 1
            instruction = memory.byte(addr + len(self))

            if instruction == 0xF0 and channel_nr == 2:
                instruction = 0x3F0

            if instruction == 0xFE:
                if channel_nr == 0:
                    instruction = 0x2FE
                elif channel_nr == 1:
                    instruction = 0x1FE
                elif channel_nr == 2:
                    instruction = 0x3FE

            if instruction >= 0xE0:
                opcode_data = OPCODES.get(instruction)
            else:
                opcode_data = ("none",)
            for param in opcode_data[1:]:
                if param == "mptr":
                    target = memory.word(addr + len(self) + size)
                    memory.addAutoLabel(target, addr + len(self), "data")
                    MusicBlock(memory, target, channel_nr=channel_nr)
                if param == "ptr":
                    target = memory.word(addr + len(self) + size)
                    if 0x4000 <= target < 0x8000:
                        memory.addAutoLabel(target, addr + len(self), "data")
                size += PARAM_SIZE[param]
            print(hex(addr + len(self)), hex(instruction), channel_nr, len(self), size)
            if memory[addr + len(self) + size - 1] is not None:
                print("OMG")
                break
            self.resize(len(self) + size)

            if instruction == 0xFF or instruction == 0xF1: # channels seem to loop on this jump.
                break

    def export(self, file):
        while file.addr < self.base_address + len(self):
            self.outputInstruction(file)

    def outputInstruction(self, file):
        instruction = self.memory.byte(file.addr)

        if instruction < 0xE0:
            note = self.memory.byte(file.addr)
            name = NOTES.get(note & 0xF0)
            file.asmLine(1, name + '_' + str(note & 0x0f))
            return

        if instruction == 0xF0 and self.channel_nr == 2:
            instruction = 0x3F0

        if instruction == 0xFE:
            if self.channel_nr == 0:
                instruction = 0x2FE
            elif self.channel_nr == 1:
                instruction = 0x1FE
            elif self.channel_nr == 2:
                instruction = 0x3FE

        opcode = OPCODES.get(instruction)
        if opcode is None:
            file.asmLine(1, "db", f"${self.memory.byte(file.addr):02X}", comment="unknown music opcode")
            return
        size = 1
        params = []
        for param in opcode[1:]:
            if param == "byte":
                params.append(f"${self.memory.byte(file.addr+size):02x}")
            elif param in {"ptr", "mptr"}:
                label = self.memory.getLabel(self.memory.word(file.addr+size))
                if label:
                    params.append(str(label))
                else:
                    params.append(f"${self.memory.word(file.addr+size):04x}")
            else:
                params.append("??")
            size += PARAM_SIZE[param]
        file.asmLine(size, opcode[0], *params)
