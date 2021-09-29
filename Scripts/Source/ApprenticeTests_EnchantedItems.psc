scriptName ApprenticeTests_EnchantedItems extends ApprenticeTest

function Tests()
    Test("Setting to use enchanted items when untrained").Fn(EnchantedItemRestriction_Test())
endFunction

function BeforeEach()
    parent.BeforeEach()
    Apprentice.Apprentice_Settings_RestrictEnchantedItemUsage.SetValueInt(1) ; Assume on by default
endFunction

function EnchantedItemRestriction_Test()
    Armor theArmor = EnchantedArmor()

    ExpectStringArray(Apprentice.ShownMessages).To(Equal("[]")) ; TODO BeEmpty()

    ; Equip + Trigger OnObjectEquipped()
    Player.EquipItem(theArmor, abSilent = true)
    Apprentice.OnObjectEquipped(theArmor, None)

    ExpectPlayer().Not().To(HaveEquippedItem(theArmor))
    ExpectStringArray(Apprentice.ShownMessages).To(ContainText("You are not trained in Restoration"))
    Apprentice.ClearShownMessages()

    ; Change the setting
    Apprentice.Apprentice_Settings_RestrictEnchantedItemUsage.SetValueInt(0) ; Disable

    ; Equip + Trigger OnObjectEquipped()
    Player.EquipItem(theArmor, abSilent = true)
    Apprentice.OnObjectEquipped(theArmor, None)

    ExpectPlayer().To(HaveEquippedItem(theArmor))
    ExpectStringArray(Apprentice.ShownMessages).To(Equal("[]")) ; TODO BeEmpty()
endFunction
