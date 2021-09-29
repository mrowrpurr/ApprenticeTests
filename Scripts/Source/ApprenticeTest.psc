scriptName ApprenticeTest extends SkyUnitTest hidden
{Base class for all Apprentice SkyUnit tests}

Actor property Player auto
ApprenticePlayer property Apprentice auto
ApprenticeMCM property MCM auto

function BeforeAll()
    Player = Game.GetPlayer()
    Apprentice = ApprenticePlayer.GetInstance()
    MCM = Game.GetFormFromFile(0xd62, "Apprentice.esp") as ApprenticeMCM
endFunction

; Resets the training status before each test
function BeforeEach()
    Apprentice.ResetAllTrainingStatus()
    Apprentice.Apprentice_Settings_NotificationOption.SetValueInt(0) ; Disable messageboxes
    Apprentice.ClearShownMessages()
    Apprentice.SaveShownMessages = true
endFunction

Spell function AlterationSpell()
    return Game.GetForm(0x43324) as Spell
endFunction

Spell function ConjurationSpell()
    return Game.GetForm(0x211eb) as Spell
endFunction

Spell function DestructionSpell()
    return Game.GetForm(0x12fcd) as Spell
endFunction

Spell function IllusionSpell()
    return Game.GetForm(0x27eb6) as Spell
endFunction

Spell function RestorationSpell()
    return Game.GetForm(0x12fcc) as Spell
endFunction

Furniture function AlchemyTable()
    return Game.GetForm(0x8ad0c) as Furniture
endFunction

Furniture function EnchantingTable()
    return Game.GetForm(0x8ad0d) as Furniture
endFunction

Furniture function Forge()
    return Game.GetForm(0xcae0b) as Furniture
endFunction

Furniture function Workbench()
    return Game.GetForm(0xd932f) as Furniture
endFunction

Furniture function Smelter()
    return Game.GetForm(0x9c6ce) as Furniture
endFunction

Furniture function TanningRack()
    return Game.GetForm(0x727a1) as Furniture
endFunction

Door function LockedDoor()
    return Game.GetForm(0x1341f) as Door
endFunction

Weapon function Longbow()
    return Game.GetForm(0x3b562) as Weapon
endFunction

Weapon function Sword()
    return Game.GetForm(0x12eb7) as Weapon
endFunction

Weapon function Greatsword()
    return Game.GetForm(0x1359d) as Weapon
endFunction

Armor function Clothing()
    return Game.GetForm(0x106661) as Armor
endFunction

Armor function LightArmor()
    return Game.GetForm(0x3619e) as Armor
endFunction

Armor function HeavyArmor()
    return Game.GetForm(0x12e4d) as Armor
endFunction

Armor function Shield()
    return Game.GetForm(0x12eb6) as Armor
endFunction

Armor function EnchantedArmor()
    return Game.GetForm(0x10d66a) as Armor
endFunction

Armor function BackpackFromCamping()
    return Game.GetFormFromFile(0x2c261, "Campfire.esm") as Armor
endFunction
