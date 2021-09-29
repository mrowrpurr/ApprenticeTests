scriptName ApprenticeTests_MCM_Misc extends ApprenticeTest

function Tests()
    Test("Get and Set AV").Fn(Get_Set_AV_Test())
endFunction

function Get_Set_AV_Test()
    Player.SetActorValue("Health", 123)
    ExpectFloat(Player.GetActorValue("Health")).To(EqualFloat(123))

    ; GetAV
    ExpectFloat(MCM.GetAV("Health")).To(EqualFloat(123))
    ExpectFloat(MCM.GetAV("Health")).Not().To(EqualFloat(456))

    ; SetAV
    MCM.SetAV("Health", 456)

    ExpectFloat(Player.GetActorValue("Health")).To(EqualFloat(456))
    ExpectFloat(MCM.GetAV("Health")).To(EqualFloat(456))
endFunction
