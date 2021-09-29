scriptName ApprenticeTests_Armor extends ApprenticeTest

function Tests()
    Test("No armor, only clothes").Fn(Clothes_Test())
    Test("Light Armor OK").Fn(LightArmor_Test())
    Test("Heavy Armor OK").Fn(HeavyArmor_Test())
    Test("Shields OK")
    Test("Enchanted armor")
    Test("Backpacks OK")
    Test("Reequips Armor Taken Off")
endFunction

function Clothes_Test()
    Armor clothes = Clothing()
    Player.AddItem(clothes, abSilent = true)
    Player.UnequipItem(clothes, abSilent = true)

    ExpectPlayer().Not().To(HaveEquippedItem(clothes))

    ; Equip + Trigger OnObjectEquipped()
    Player.EquipItem(clothes, abSilent = true)
    Apprentice.OnObjectEquipped(clothes, None)

    ; No restriction on clothing
    ExpectPlayer().To(HaveEquippedItem(clothes))
endFunction

function LightArmor_Test()
    Armor theArmor = LightArmor()
    Player.AddItem(theArmor, abSilent = true)
    Player.UnequipItem(theArmor, abSilent = true)

    ExpectPlayer().Not().To(HaveEquippedItem(theArmor))
    ExpectBool(Apprentice.IsSkillTrained("LightArmor")).To(BeFalse(), \
        "Expected player not to be trained in LightArmor")

    ; Equip + Trigger OnObjectEquipped()
    Player.EquipItem(theArmor, abSilent = true)
    Apprentice.OnObjectEquipped(theArmor, None)

    ExpectPlayer().Not().To(HaveEquippedItem(theArmor))

    Apprentice.SetSkillTrained("LightArmor")

    ; Equip + Trigger OnObjectEquipped()
    Player.EquipItem(theArmor, abSilent = true)
    Apprentice.OnObjectEquipped(theArmor, None)

    ExpectPlayer().To(HaveEquippedItem(theArmor))
endFunction

function HeavyArmor_Test()
    Armor theArmor = HeavyArmor()
    Player.AddItem(theArmor, abSilent = true)
    Player.UnequipItem(theArmor, abSilent = true)

    ExpectPlayer().Not().To(HaveEquippedItem(theArmor))
    ExpectBool(Apprentice.IsSkillTrained("HeavyArmor")).To(BeFalse(), \
        "Expected player not to be trained in HeavyArmor")

    ; Equip + Trigger OnObjectEquipped()
    Player.EquipItem(theArmor, abSilent = true)
    Apprentice.OnObjectEquipped(theArmor, None)

    ExpectPlayer().Not().To(HaveEquippedItem(theArmor))

    Apprentice.SetSkillTrained("HeavyArmor")

    ; Equip + Trigger OnObjectEquipped()
    Player.EquipItem(theArmor, abSilent = true)
    Apprentice.OnObjectEquipped(theArmor, None)

    ExpectPlayer().To(HaveEquippedItem(theArmor))
endFunction
