using System;


public enum EventDef
{
    NetConnectSuccess,  //网络链接成功
    NetConnectFaild,    //网络链接失败
    NetDisconnect,      //网络断开链接
    NetReconnect,       //网络重连
    NetRecvOrSendDisconnect,

    RoleLoginOk,        //角色登陆成功

    PlaySingelResetState,


    PlayRunLastOver,    //上次闪灯完毕
    PlayRunColorOver,   //颜色转灯完毕
    PlayRunP2POver,     //点到点转灯完毕
    PlayRunP2POneOver,  //点到点转灯完毕(只拖尾一个灯)
    PlayAudioFruitOver, //水果声音播放完毕
    PlayAudioFruitOver2,//水果声音播放完毕
    PlayAudioColorOver, //颜色声音播放完毕
    PlayAudioDongOver,  //声音dong播放完毕
    PlayAudioDongOver2,  //声音dong播放完毕
    PlayAudioDongOver3,  //声音dong播放完毕
    PlayAudioDongOver4,  //声音dong播放完毕
    PlayAudioSongOver,
    PlayAudioCJOver,
    PlayAudioCongratulations,
    PlayAudioCongratulations2,
    PlayAudioDingDingOver,
    PlayAudioJiuJiuBangOver,
    PlayAudioChanceComeOver,
    PlayAudioBababaOver,
    PlayAudioTLBBOver,
    PlayAudioXMBSOver,
    PlayAudioOneMoreOver,
    PlayAudioSwikeOver,
    PlayAudioZhaOver,
    PlayAudioTimesOver,
    PlayAudioZhuDongDongOver,
    PlayAudioAouOver,
    PlayAudioYJSDOver,
    PlayAudioYeDuDuOver,
    PlayAudioZHSHOver,
    PlayAudioShutUpOver,
    PlayAudioJiuJiuHalfOver,
    PlayAudioJGNDXSOver,
    PlayAudioDuoShiYaOver,
    PlayAudioDengDengOver,
    PlayAudioJiuJiuOver,

    PlayRunTurn4DirOver,  //4个方向转灯

    PlayAudioSYDengDengOver,
    PlayAudioSYThreeYuanOver,
    PlayRunThreeYuanOver,

    PlayDDPRunAllFruitHighOver,
    PlayDDPAudioOver,
    PlayDDPAudioDengDengOver,
    PlayDDPRunDDPOver,

    PlayDMGAudioBBBOver,
    PlayDMGAudioOver,
    PlayDMGRunOver,

    PlayJLBDAudioOver,
    PlayJLBDAudioDengDengOver,
    PlayJLBDRunOver,

    PlayCjBBBAudioJiuJiuBangOver,
    PlayCjBBBAudioCjbbbOver,
    PlayCjBBBAudioJiuJiuDuOver,
    PlayCjBBBAudioTimesOver,
    PlayCjBBBRunMulOver,

    PlayFHLAudioOver,

    PlayZHSHTurnOver,
    PlayDARENTurnOver,

    PlayBarRunJiuJiuJiuThreeOver,

    RoomBack,
    RoomBackOk,

    ChatType,
    RmbMultiClick,

    LoginUnameOk,
}
