scriptName ApprenticeTests_Armor extends ApprenticeTest

function Tests()
    Test("No armor, only clothes")
    Test("Light Armor OK").Fn(LightArmor_Test())
    Test("Heavy Armor OK")
    Test("Shields OK")
    Test("Enchanted armor")
    Test("Backpacks OK")
    Test("Reequips Armor Taken Off")
endFunction

function Clothes_Test()
endFunction

function LightArmor_Test()
    Armor theArmor = LightArmor()
    Player.AddItem(theArmor)
    Player.UnequipItem(theArmor)

    ExpectPlayer().Not().To(HaveEquippedItem(theArmor))
    ExpectBool(ApprenticePlayerScript.IsSkillTrained("LightArmor")).To(BeFalse(), \
        "Expected player not to be trained in LightArmor")

    ; Equip + Trigger OnObjectEquipped()
    Player.EquipItem(theArmor)
    ApprenticePlayerScript.OnObjectEquipped(theArmor, None)

    ExpectPlayer().Not().To(HaveEquippedItem(theArmor))

    ApprenticePlayerScript.SetSkillTrained("LightArmor")

    ; Equip + Trigger OnObjectEquipped()
    Player.EquipItem(theArmor)
    ApprenticePlayerScript.OnObjectEquipped(theArmor, None)

    ExpectPlayer().To(HaveEquippedItem(theArmor))
endFunction

function HeavyArmor_Test()

endFunction
