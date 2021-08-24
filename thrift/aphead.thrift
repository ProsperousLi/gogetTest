namespace cpp com.vrv.im.service
namespace go im.service
namespace java com.vrv.im.service

struct YMD {
  1: i16 year    // 0 不被使用
  2: byte month  // 从1开始
  3: byte day    // 从1开始
}

/**
 * 用户的账号信息
 */
struct AccountType{
	1: byte type;/* 账号类型 1：电话, 3：邮箱, 4：userID, 5:身份证, 6：豆豆号, 7:自定义帐号(不做限制)*/
	2: string accounts; /* 账号*/
	3: optional string mark; /* 标识*/
}

struct SmallUserBean {
  //1: optional string phoneNum; /*电话号码  可以删除*/
  //2: optional string email;   /*邮箱  可以删除*/
  3: string name; /*好友的用户名*/
  5: optional byte sex; /*好友的性别：2：女，1：男*/
  6: byte status; /*账号状态：用户状态 1：正常 2：停用 3: 注册邀请4: 影子用户，5:锁定，6:冻结*/
  7: string portraitURL; /*好友头像url*/
  8: optional string sign; /*个性签名*/
  9: i64 userID; /*好友的用户ID*/
  //10: optional i64 qqNum; /*QQ号码*/
  11: optional byte match; /*匹配查询类型, 1:qqNum 2:phoneNum 4:email 8:userID 16:name */
  12: optional list<string> phoneNums;  /*电话号码清单*/
  13: optional list<string> emails; /*邮箱清单 */
  14: string oriPortraitURL; /*原始好友头像url*/
  15: optional YMD birthday; /*生日*/
  16: optional string accountName; /*账号名称*/
  17: optional i64 lockDeadline;/*锁定截止时间，毫秒*/
  18: optional i64 remainLockDuration;/*剩余锁定时长，毫秒*/
  19: optional i64 SDKID;/* SDKID */
  20: optional double score;/* 匹配度 */
  21: optional string area; /*区域 */
  22: optional string entExtend;/*企业扩展信息*/
  23: optional list<AccountType> accounts; /*联系方式集合 */
  24: optional string orgID;/*组织结构id,多个用逗号分隔*/
  25: optional i64 roleID;/*角色ID*/
  26: optional byte bizStatus;/*业务状态，1：初始默认，2：在高管层*/
  27: optional byte uploadFlag;/*上传标识, 1:未上传,2:已上传,3:已忽略*/
  28: optional string realname;/*真实姓名*/
  29: optional string extend; /*扩展信息*/
  30: optional list<OrganizationBean> orgList; /*用户所属组织*/
}

struct TinyUserBean {
   /*好友的用户ID*/
   1: i64 userID;
   /*好友的用户名*/
   2: optional string name;
   /*好友的性别：2：女，1：男, 0: 未知*/
   3: optional byte sex;
   /*账号状态：用户状态 1：正常 2：停用 3: 注册邀请4: 影子用户，5:锁定，6:冻结*/
   4: optional byte status;
   /*好友头像url*/
   5: optional string portraitURL;
   /*好友的备注名*/
   6: optional string remark;
   /*所在的组ID*/
   7: optional i64 groupID;
   /*个性签名*/
   8: optional string sign;
   /*服务器分页, 从1开始*/
   9: optional i16 page;
   /*好友类型：1：好友，2：关注 3: 被关注(粉丝) 4: 陌生人*/
   10: optional byte tinyUserType;
   /*特别好友/星标好友 1: 星标*/
   11: optional byte starBuddy;
    /*时区**/
   12: optional byte timeZone;
   13: optional list<string> phoneNums;  /*电话号码清单*/
   14: optional list<string> emails; /*邮箱清单 */
   15: optional string oriPortraitURL; /*原始好友头像url*/
   16: optional string backgroundURL; /*聊天背景地址*/
   17: optional string accountName; /*账号名称*/
   18: optional string area; /*区域 */
   19: optional YMD birthday; /*生日*/
   20: optional i64 lockDeadline;/*锁定截止时间，毫秒*/
   21: optional i64 remainLockDuration;/*剩余锁定时长，毫秒*/
   22: optional i64 SDKID;
   23: optional list<AccountType> accounts; /*联系方式集合 */
   /*好友类型标识:1:人 2:公众号*/
   24: optional i16 userTypeNum;
   /*key设置类型  1：个人设置，value设置值 1为接收提醒 2表示不提醒仅显示数字 3:为免打扰*/
   25: optional map<i32,i32> buddySetting;
}

/**
 * 一级用户服务对外提供的用户对象
 */
struct UserBaseBean {
  1: optional i64 userID; /*用户ID*/
  2: optional i64 SDKID;/*SDKID*/
  //3: optional i16 userType; /*用户类型*/
  4: optional string name; /*用户名 */
  5: optional byte status; /*用户状态 1：正常 2：停用 3: 注册邀请4: 影子用户，5:锁定，6:冻结*/
  6: optional string portraitURL; /*头像地址*/
  7: optional i64 changeVersion; /*修订版本号*/
}

struct BuddyBean {
   /*好友类型标识:1:人 2:公众号*/
   1: optional i16 userTypeNum;
   /*好友信息*/
   2: optional TinyUserBean tinyUserBean;
}

struct UserBean {
  1: optional i64 userID; /*用户ID*/
  //2: optional string phoneNum;  /*可以删除 */
  //3: optional string email; /*可以删除 */
  //4: optional i16 userType; /*目前没有意义*/
  5: optional string name; /*用户名 */
  6: optional string pwd; /*用户密码 */
  7: optional byte sex; /* 性别*/
  8: optional string area; /*区域 */
  9: optional YMD birthday; /*生日*/
  //10: optional string school;  /*毕业学校*/
  //11: optional i64 qqNum; /*可以删除*/
  //12: optional string maccode; /*目前无意义*/
  13: optional byte status; /*用户状态 1：正常 2：停用 3: 注册邀请4: 影子用户，5:锁定，6:冻结*/
  14: optional string portraitURL; /*头像地址*/
  15: optional string sign; /*签名*/
  16: optional byte timeZone;  /*时区*/
  17: optional list<string> phoneNums;  /*电话号码清单*/
  18: optional list<string> emails; /*邮箱清单 */
  19: optional string oriPortraitURL; /*原始头像地址*/
  //20: optional string idcard; /*可以删除*/
  21: optional string accountName; /*账号名称*/
  22: optional string extend; /*扩展信息*/
  23: optional i64 lockDeadline;/*锁定截止时间，毫秒*/
  24: optional i64 remainLockDuration;/*剩余锁定时长，毫秒*/
  25: optional i64 SDKID;/*SDKID*/
  26: optional string entExtend;/*企业扩展信息*/
  27: optional list<AccountType> accounts; /*联系方式集合 */
  28: optional byte regFlag; /*注册标识0为更新1为注册 */
  29: optional byte pwdStrength;/*密码强度:1:弱,2:中,3:强*/
  30: optional string orgID;/*组织结构id,多个用逗号分隔*/
  31: optional i64 roleID;/*角色ID*/
  32: optional byte bizStatus;/*业务状态，1：初始默认，2：在高管层*/
  33: optional byte uploadFlag;/*上传标识, 1:未上传,2:已上传,3:已忽略*/
  34: optional byte oldStatus; /*保存冻结之前用户状态status的值*/
  35: optional string realname;/*真实姓名*/
  36: optional double score;/* 匹配度 */
  37: optional byte match; /*匹配查询类型, 1:qqNum 2:phoneNum 4:email 8:userID 16:name */
  38: optional string importFlag;/*第三方导入标识*/
  39: optional i64 regTime;/*注册时间*/
  40: optional string tagIds;/*用户标签id,多个用逗号分隔*/
}


struct MessageStorageBean{
 //发送者ID
 1: i64 sendUserID;
 //接收者ID,人或者群
 2: i64 receTargetID;
 //发送消息时间
 3: i64 sendTime;
 //发送消息内容
 4: optional string message;
 //是否阅读即焚，2:否，1:是
 //5: byte isBurn;
 //消息类型 1:html 2:文本，3:音频 4: 位置 5:图片6:文件 7:名片 8:弱提示
 6: byte messageType;
 //服务端发送消息ID
 7: i64 messageID;
 /*内容格式：公共平台使用，如：JSON/TXT*/
 8: string format;
 /*服务端上次发送消息ID*/
 9: optional i64 lastMessageID;
 /*发送者sessionID*/
 10: optional i64 senderSessionID;
 /*限制消息用户范围，群消息使用*/
 11: optional list<i64> limitRange
 /*消息属性*/
 12: optional string msgProperties
 /*消息事件属性  1：阅后即焚*/
 13: optional byte activeType
 /*@相关人*/
 14: optional list<i64> relatedUsers
 /*关联消息ID*/
 15: optional i64 relatedMsgID
 16: optional i64 SDKID;
 /*是否设置已读 2：否，其他是，默认为设置*/
 17: optional byte setRead;
 /*陌生人单聊时的来源ID，1_groupID表示传的群ID，2_orgID表示传的组织ID*/
 18: optional string sourceID;
 /*子消息类型*/
 19: optional i32 subMsgType;
 /*消息未读数*/
 20: optional i32 unreadCount;
 /*群快照id*/
 21: optional i64 snapshotID;
 /* 对于安卓客户端，如果apFlag为1，表示该消息是客户端暂离期间的推送，已经走了云推，不需要展示在通知栏 */
 900: optional i64 apFlag;
}

struct MessageBean {
  /*发送者ID*/
  1: i64 userID;
  /*接收者ID,可以是人，可以是群ID*/
  2: i64 targetID;
  /*发送消息内容*/
  3: string message;
  /*是否阅读即焚，2:否，1:是 用activeType属性区分*/
  //4: byte isBurn;
  /**消息类型（新增类型请务必添加注释）
  1：html
  2：文本
  3：语音 
  4：位置 
  5：图片
  6：文件 
  7：名片 
  8：弱提示
  9：网页链接消息
  10：应用推送消息
  11：指令消息
  12：机器人图文消息
  13：组合消息
  14：音视频请求消息（比如：呼叫消息、邀请消息、结束消息）
  15：音视频握手消息（比如：接听）
  16：语音视频预留类型
  17：任务消息
  18：消息撤回
  19：动态表情
  20：端到端
  21-25：验证消息预留类型
  26：模板消息
  27：自定义表情消息
  28：九宫格图片消息
  ...未知
  31：邮件消息
  ...未知
  34：已读未读消息
  35：记事本
  36：应用分享消息
  37：潜水者消息
  ...未知
  64：消息置顶动作（subMsgType：2置顶 3取消置顶）
  ...未知
  66：智能客服消息
  ...未知
  88：红包类型
  89：微视频消息
  ...未知
  99：SDK特殊消息类型
  100：系统消息
  */
  5: byte messageType;
  /*客户端本地消息ID*/
  6: i64 localID;
  /*MAC地址*/
  7:optional string maccode;
  /*内容格式 ：公共平台使用，如：JSON/TXT*/
  8: string format;
  /*限制消息用户范围，群消息使用*/
  9: optional list<i64> limitRange
  /*消息属性*/
  10: optional string msgProperties
  /*消息事件属性  1：阅后即焚*/
  11: optional byte activeType
  /*@相关人*/
  12: optional list<i64> relatedUsers
  /*关联消息ID*/
  13: optional i64 relatedMsgID
  14: optional i64 SDKID
  /*是否设置已读 2：否，其他是，默认为设置*/
  15: optional byte setRead;
  /*陌生人单聊时的来源ID，1_groupID表示传的群ID，2_orgID表示传的组织ID*/
  16: optional string sourceID;
  /*子消息类型*/
  17: optional i32 subMsgType;
}

struct RequestBuddyBean {
   1: byte requestType;  /*请求类型:1:好友2：关注*/
   2: i64 userID;  /*被请求好友用户ID*/
   3: optional list<string> verifyInfo; /*验证信息或者回答问题信息*/
   4: optional i64 groupID;  /*请求添加好友到那个组*/
   5: optional string remark;  /*备注*/
   6: optional i64 reqVerifyboxID; /*盒子ID 加外服好友用*/
   7: optional i64 SDKID;
}

struct ResponseBuddyBean {
   1: i64 userID; /*原请求用户ID*/
   2: optional string refuseReason;  /*拒绝理由*/
   3: optional i64 groupID; /*添加好友到那个组*/
   4: optional string remark; /*备注*/
   5: byte isAgree; /*是否同意，1：同意，2：不同意，3：以后不允许添加，4：忽略*/
   6: i64 reqVerifyboxID; /*验证盒子请求消息ID*/
   7: optional i64 SDKID;
   8: optional i64 inviteMark; /*1:注册邀请*/
}

struct BuddyReqBean {
   /*请求验证ID*/
   1: i64 reqVerifyboxID;
   /*请求用户*/
   2: SmallUserBean reqUserBean;
   /*验证信息或者回答问题信息*/
   3: list<string> verifyInfo; 
    /**请求类型:1:添加好友请求,2：请求关注类型
    */
   4: byte requestType; 
   /*请求时间*/
   5: i64 requestTime;
   /* 是否需要应答,1,需要应答, 2,不需要应答(自动加好友或允许任何人加好友)*/
   6: byte isResponse; 
}

struct BuddyRespBean {
   /*验证盒子响应消息ID*/
   1: i64 respVerifyboxID;
   /*响应用户*/
   2: SmallUserBean respUserBean;
   /*拒绝理由*/
   3: string refuseReason;  
   /*是否通过验证，1：通过，2：不通过，3：拒绝并且不允许以后再添加*/
   4: byte isAgree;
   /*响应处理时间*/
   5: i64 responseTime;
}

struct MessageStorageCursor{
 //获取消息人ID
 1: i64 userID;
 //对方消息人或群ID
 2: i64 targetID;
 //最大已读消息ID
 3: i64 maxReadID;
 //最大未读消息ID
 4: i64 maxUnreadID;
 5: optional i64 SDKID;
 //最小消息ID
 6: i64 minMessageID;
 //已推送消息ID
 7: optional i64 pushMaxID;
 // 当前设备最大已读消息ID
 8: optional i64 currentMaxReadID;
}

struct Messages{
  //最近的消息ID  返回-1表示此人不在群里面
  1: i64  messageIDOfLate;
  //消息内容体
  2: list<MessageStorageBean> messageList;
  //返回所有设备的最大的已读ID
  3: i64 maxReadID;
  4: optional i64 SDKID;
}

// 通信录信息
struct ContactBean {
  1: string contactNum; //联系人号码
  2: string name        // 联系人名字
  3: byte source;       //数据来源 1：手机通讯录； 2：qq好友；
  4: optional i64 SDKID;//SDKID
}

// 推荐信息
struct RecommendContact{
  1: ContactBean contact; // 通信录信息
  2: SmallUserBean sub; //联系人信息
  3: optional SmallUserBean recommend; //推荐者信息
  4: byte isBuddy;  //是否是好友标识，1表示是好友关系，2表示不是好友关系, 3表示等待验证
}

// 自动关注信息,包括通信录信息和对应的联系人信息
struct AutoAttentionBean {
  1: ContactBean cb;
  2: TinyUserBean tub;
}

// 处理通信录返回的信息,包括自动关注和推荐两类
struct HandledContactBean {
  1: optional list<AutoAttentionBean> aabs;
  2: optional map<i16, i64> pageTimestamp;        // 这些被关注对象对应页的时间戳
  3: list<RecommendContact> recommends;    // 推荐者,那些无法自动加好友的人
  4: i64 timestamp;       
  5: optional i64 SDKID;                        // 对应的推荐ID
}
//群增值信息
struct GroupValueAddedAttr{
   /*群增值服务属性*/
   1: optional i64 groupValueAddedAttr;
   /*群可建成员数*/
   2: optional i32 groupMemberNum;
}
struct TinyGroupInfo{
   /*群ID*/
   1: optional i64 groupID;
   /*群名称*/
   2: optional string groupName;
   /*群头像*/
   3: optional string groupIcon;
   /*群公告*/
   4: optional string groupBulletin;
   /*群级别*/
   5: optional byte groupLevel;
   /*群成员数*/
   6: optional i32 groupMemberNum;
   /*群创建者*/
   7: optional i64 createUser;
   /*群创建时间*/
   8: optional i64 createTime;
   /*相关群ID*/
   9: optional i64 relatedGroupID;
   /*相关企业ID*/
   10: optional i64 relatedEnterpriseID;
   /*群背景图片URL*/
   11: optional string groupBackgroundURL;
   /*群扩展字段*/
   12: optional string extendProperties;
   /* SDKID */
   13: optional i64 SDKID;
   /*群消息通知详情: 1、开启(显示详情)  2、关闭(显示通知源，隐藏内容)  默认开启*/
   14: optional byte groupMessageContentMode;
   /*群简介*/
   15: optional string groupBrief;
   /*群是否可以被检索 1：可以 2：不可以*/
   16: optional byte groupSearch;
   17: optional byte activeExitFlag;/*主动退出标识, 0:可以主动退出,1:不能主动退出*/
   18: optional i32 UTOGStatus;/*操作状态*/
   /*群分类 组织群：org , 企业群：enterprise   */
   19: optional string groupType;
   /*添加群的人：目前只针对企业群*/
   20: optional i64 addGroupUserID;
   21:optional i64 gForbidUntil; /*群禁言截止时间 */
}

struct ShieldGroupMessageSet{
   /*PC群消息设置 1：提示接收 2：不提示，显示数目 3：屏蔽消息 4：时间段接收 5：插电接收 6:群免打扰*/
   10: optional byte pcMsgSet;
   /*phone/pad群消息设置 1：提示接收 2：不提示，显示数目 3：屏蔽消息 4：时间段接收 5：插电接收 6:群免打扰*/
   11: optional byte phoneMsgSet;
   /*HTML群消息设置 1：提示接收 2：不提示，显示数目 3：屏蔽消息 4：时间段接收 5：插电接收 6:群免打扰*/
   12: optional byte htmlMsgSet;
   /*接收消息时间段*/
   13: optional string receiveTimePeriod;
   /*群通知消息内容模式: 1、通知详情  2、通知源，隐藏内容  3、完全隐藏 , 默认开启模式1*/
   14: optional byte groupMessageContentMode;
   /* V标 1:是 0:否, 默认是0 */
   15: optional byte vsign;
}

struct UserGroupTimeStampInfo {
	/*有更新的群列表*/
	1: list<TinyGroupInfo> tinyGroupInfos;
	/*本次返回的最大时间戳 */
	2: optional i64 maxTimeStamp;
	/*本次返回的最大群号 */
	3: optional i64 groupID;
	/*是否还有更新记录：0没有 1有*/
	4: optional i16 isHavMark;
    /*群屏蔽列表*/
    5: list<ShieldGroupMessageSet> shieldList;
}

//群信息
struct GroupInfo{
   /*群ID*/
   1: optional i64 groupID;
   /*群名称*/
   2: optional string groupName;
   /*群头像*/
   3: optional string groupIcon;
   /*群分类*/
   4: optional string groupType;
   /*群简介*/
   5: optional string groupBrief;
   /*群公告*/
   6: optional string groupBulletin;
   /*群级别*/
   7: optional byte groupLevel;
   /*群是否可以被检索 1：可以 2：不可以*/
   8: optional byte groupSearch;
   /*群是否激活 1：激活，2：未激活*/
   9: optional byte groupActive;
   /*群成员数*/
   10: optional i32 groupMemberNum;
   /*群增值服务对象*/
   11: optional GroupValueAddedAttr groupAddedAttr;
   /*群创建者*/
   12: optional i64 createUser;
   /*群创建时间*/
   13: optional i64 createTime;
   /*相关群ID*/
   14: optional i64 relatedGroupID;
   /*相关企业ID*/
   15: optional i64 relatedEnterpriseID;
   /*群背景图片URL*/
   16: optional string groupBackgroundURL;
   /*本地服务器地址*/
   17: optional string serverInfo;
   /*群扩展字段,以json形式,目前：  ;
   	* 警种ID： policeTypeID 
   	* 地域---省份ID：provinceID
   	* 地域---市ID： cityID 
   	* 私信模式：privateMsg：1为开启私信   0表示不允许私信
   */
   18: optional string extendProperties;
   /* SDKID */
   19: optional i64 SDKID;
   /*群消息通知详情: 1、开启(显示详情)  2、关闭(显示通知源，隐藏内容)  默认开启*/
   20: optional byte groupMessageContentMode;
   21: optional byte uploadFlag;/*上传标识, 1:未上传,2:已上传,3:已忽略*/
   22: optional byte activeExitFlag;/*主动退出标识, 0:可以主动退出,1:不能主动退出*/
   23: optional string userName; /*创建人名称*/
   24: optional i64 snapshotID; /*群快照id*/
   /*添加群的人：目前只针对企业群*/
   25: optional i64 addGroupUserID;
   26: optional i64 gForbidUntil; /*群禁言截止时间 */
}
//群请求
struct GroupRequest{
   /*请求ID*/
   1: optional i64 reqID;
   /*申请用户ID*/
   2: i64 reqUserID;
   /*群ID*/
   3: i64 groupID
   /*请求验证信息*/
   4: optional string verifyInfo;
   /*请求类型，1：邀请，2：验证*/
   5: byte reqType;
   /*请求时间*/
   6: optional i64 reqTime;
   /*状态 1：未处理 2：处理*/
   7: optional byte status;
   /*被邀请用户*/
   8: optional list<i64>  inviteUsers; 
   /*里面只有群名称，接收展示用*/
   9: optional GroupInfo  groupInfo;
   /*里面只有申请用户昵称，接收展示用*/
   10: optional SmallUserBean userBean;
   /* SDKID */
   11: optional i64 SDKID;
}
struct GroupSet {
   /*验证类型:1:不允许任何人添加,2：需要验证信息,3：允许任何人添加*/
   1: optional byte verifyType;
   /*是否允许群成员邀请好友加入群:1,允许 2,不允许*/
   2: optional byte isAllow;
   /* SDKID */
   3: optional i64 SDKID;
}
//群响应
struct GroupResponse{
   /*响应ID*/
   1: optional i64 respID;
   /*申请用户ID*/
   2: i64 reqUserID;
   /*群ID*/
   3: optional i64 groupID
   /*响应/被邀请用户ID*/
   4: optional i64 respUserID;
   /*处理结果 1：忽略 2：同意 3： 拒绝  4:拒绝并不允许再次请求  5:群解散 6:群移除 7:主动退出*/
   5: byte respResult;
   /*拒绝理由*/
   6: optional string refuseReason;
   /*响应时间*/
   7: optional i64 respTime;
   /*响应类型，1：邀请，2：验证  3：群操作*/
   8: byte respType;
   /*里面只有群名称，接收展示用*/
   9: optional GroupInfo  groupInfo;
   /*里面只有响应用户昵称，接收展示用*/
   10: optional SmallUserBean userBean;
   /* SDKID */
   11: optional i64 SDKID;
}
struct TinyGroupMemberInfo{
   /*用户ID*/
   1: optional i64 userID;
   /*用户信息昵称*/
   2: optional string userName;
   /*属性 1：普通用户 2：管理员 3：超级管理员*/
   3: optional byte userType;
   /*用户头像*/
   4: optional string avatar;
   /* SDKID */
   5: optional i64 SDKID;
   /* V标识:0:不提醒，1:始终提醒 */
   6: optional byte vSign;
   /* 备注*/
   7: optional string remark;
   /* 返回类型编码:1:人 2：公众号 3：群*/
   8: optional i16 userTypeNum;
   /*性别 1：男 2：女*/
   9: optional byte userSex;
   /*简洁扩展字段*/
   10: optional string extend;
   /*群成员昵称*/
   11: optional string groupMemberName;
   12: optional i64 uForbidUntil; /*群成员禁言截止时间 */
}
struct GroupForbid {
	/*设置群禁言的群id*/
	1: i64 groupId;
	/*操作的群用户id*/
	2: optional i64 targetId;
	/*1.解除群禁言 2.设置群禁言 3.解除用户禁言 4.设置用户禁言*/
	3: byte operate;
}

struct GroupMemberInfo{
   /*群ID*/
   1: optional i64 groupID;
   /*用户ID*/
   2: optional i64 userID;
   /*昵称*/
   3: optional string userName;
   /*性别 1：男 2：女*/
   4: optional byte userSex;
   /*电话*/
   5: optional string tel;
   /*邮箱*/
   6: optional string email;
   /*备注*/
   7: optional string remark;
   /*属性 1：普通用户 2：管理员 3：超级管理员*/
   8: optional byte userType;
   /*页码*/
   9: optional i16 page;
   /*群消息设置*/
   10: optional ShieldGroupMessageSet shieldSet;
   /*群成员头像路径设置*/
   11: optional string avatar;
   /* SDKID */
   12: optional i64 SDKID;
   /* V标识:0:不提醒，1:始终提醒 */
   13: optional byte vSign;
}

struct PushMsgBean {
  /* 推送消息类型：1：投票，2:任务，3:阅后即焚，4: html,5:企业公告，6:企业公示*/
  1: optional byte msgType;
  /* 消息ID，由服务器产生,发送时为置0*/
  2: optional i64 msgID;
  /* 发送者ID*/
  3: optional i64 createUserID;
  /* 发送给群体，目标群或企业ID*/
  4: optional i64 fromTeamID; 
  /* 发送给多人 与teamID不能同时存在*/
  5: optional list<i64> targetUserIDs; 
  /* 标题 */
  6: optional string title;
  /*消息内容*/
  7: optional string body;
  /*消息格式*/
  8: optional string format;
  /*原始消息ID*/
  9: optional i64 originalMsgID;
  /* 状态 1：未完成  2：已经完成  3：取消  4：删除*/
  10: optional byte status;
  /* 创建时间*/
  11: optional i64 createTime;
  /* 操作消息类型：1：添加，2:修改，3:删除*/
  12: optional byte operType;

  /* 客户端重试时,服务端更好的去重,localID*/
  13: optional i64 localID;
  /*MAC地址*/
  14: string maccode;
  /*是否需要验证消息重发 1：不需要*/
  15: optional byte havVaild;
  16: optional i64 SDKID;
}

struct EnterpriseBean{
/*企业ID*/
1: optional i64 enterpriseID;
/*企业全称*/
2: optional string fullName;
/*企业简称*/
3: optional string shortName;
/*企业关键字*/
4: optional string keyWords;
/*企业所属行业*/
5: optional i64 sector;
/*企业所属行业的具体哪一类*/
6: optional i64 sectorDetail;
/*企业类型*/
7: optional byte type;
/*企业所属省份*/
8: optional i64 provinceID;
/*企业所属市*/
9: optional i64 cityID;
/*企业所属地区*/
10: optional i64 areaID;
/*企业地址*/
11: optional string address;
/*企业邮编*/
12: optional string postcode;
/*企业电话*/
13: optional string phone;
/*企业传真*/
14: optional string fax;
/*企业邮箱*/
15: optional string email;
/*企业主业*/
16: optional string homepage;
/*企业简介*/
17: optional string introduction;
/*企业logURL地址*/
18: optional string logUrl;
/*企业状态：1:审核通过；2：未审核；3：审核未通过*/
19: optional byte status;
/*注册时间*/
20: optional i64 creationDate;
/*修改时间*/
21: optional i64 updatedDate;
}

struct OrganizationBean{
/* 组织机构ID*/
1: optional i64 OrgID;
/*企业ID*/
2: optional i64 enterpriseID;
/*组织机构名称*/
3: optional string orgName;
/*组织机构内码*/
4: optional string orgCode;
/*是否叶节点*/
5: optional byte leaf;
/*父节点*/
6: optional i64 parentOrgID;
/*备注*/
7: optional  string remark;
/*排序*/
8: optional i64 orderNum;
/*办公地ID*/
9: optional i64 branchID;
10: optional string departID;  /*删除*/
11: optional byte departLevel;  /*组织级别*/
12: optional i64 subOrgNum;  /*递归计算所有下级组织数*/
13: optional i64 subUserNum;  /*递归计算所有下级成员数*/
14: optional byte isHidden;  /*是否隐藏, 1对本部门公开 2对所有部门公开，3对部分部门公开*/
15: optional i64 provinceID;  /*省份ID*/
16: optional string provinceName;  /*省份名称*/
17: optional i64 cityID;  /*市ID*/
18: optional string cityName;  /*市名称*/
19: optional i64 areaID;  /*县ID*/
20: optional string areaName;  /*县名称*/
21: optional string extend;  /*拓展字段*/
22: optional i32 resCode; /*导入组织机构时,返回的错误码*/     
/* 导入组织机构时,记录EXL中数据的行数*/  
23: optional i32 exlRow;
24: optional i64 creationDate;
25: optional i64 updatedDate;
26: optional string externalOrg;   /*客户组织机构ID*/
27: optional i64 changeVersion;//修订版本号，每次修改均会变
28: optional string orgStatus;//组织状态1正常2删除
29: optional i64 orgGroupId;//组织群id
}

struct EnterpriseUserBean{
1:optional i64 userID; /*用户ID*/
2:optional i64 enterpriseID; /*企业ID*/
3:optional i64 orgID; /*组织机构ID*/
4:optional i64 roleID; /*角色ID*/
5:optional string Enname; /*企业内用户名称*/
6:optional string duty; /*企业内用户职位*/
7:optional string Enmail; /*企业内用户email*/
8:optional string Enmobile; /*企业内用户手机号*/
9:optional byte status; /*企业账号是否被停用 1：正常 2：停用*/
10:optional i64 orderNum; /*人员排序*/
/*用户修改组织机构使用，表示用户新组织机构，在修改时给用户增加组织机构时，使用newOgrID而不是orgID*/
11:optional i64 newOrgID;
12:optional string orgName; /*组织名*/
13:optional string extend; /*扩展信息*/
14:optional string accountName; /*账号名称*/
15:optional byte bizStatus;/*业务状态：1：初始状态，2：在高管群*/
16:optional string userHead; /*头像*/
17:optional byte sex;/*性别*/
18:optional string tagIds;/*用户标签*/
}

struct PushMsgCursor{
 /*获取消息人ID*/
 1: i64 userID;
 /*关联对象ID*/
 2: optional i64 teamID;
 /*最大已读消息ID*/
 3: i64 maxReadID;
 /*最大未读消息ID*/
 4: i64 maxUnreadID;
}

struct GetPushMsgsBean{
 /*获取消息人ID*/
 1: i64 userID;
 /*关联对象ID*/
 2: optional i64 teamID;
 /* 推送消息类型：1：投票，2:任务，3:阅后即焚，4: html,5:企业公告，6:企业公示*/
 3: optional byte msgType;
 /*截止消息ID*/
 4: i64 endMsgID;
 /*获取消息数*/
 5: i16 pageSize;
 /* 获取类型：1：接收，2:创建*/
 6: byte getType;
 7: optional i64 SDKID;
}

struct PushMsgList{
  //最近的消息ID 返回-1表示此人没有消息
  1: i64  msgIDOfLate;
  //消息内容体
  2: list<PushMsgBean> msgList;
}

struct VoteBean{
   /*投票人*/
   1: i64 userID;
   /*消息ID*/
   2: i64 msgID;
   /*群体ID*/
   3: optional i64 teamID;
   /*投票类型，1：正常投票，2:补充投票*/
   4: optional byte isReplenish;
   /*选择投票项*/
   5: optional list<byte> voteItemIDs;
   /*补充投票项*/
   6: optional string voteItem;
   /* SDKID */
   7: optional i64 SDKID;
}
struct TaskBean{
   /*回复人*/
   1: i64 userID;
   /*消息ID*/
   2: optional i64 msgID;
   /*群体ID*/
   3: optional i64 teamID;
   /*回复内容*/
   4: optional string replyContent;
   /*回复时间*/
   5: optional i64 replyTime;
   /* SDKID */
   6: optional i64 SDKID;
}

struct ConnectBind {
  1: i64 sessionID;
  2: string sn; // 16char
  3: byte type; // 1,http 2,udp
  4: string pwd; // 加密数据用
  5: string ip;  // 本地绑定的ip
  6: i32 port;   // 本地绑定的端口
}

/**
 * 应用信息
 */
struct SmallEntAppInfo{
   /*应用标识*/
   1: string appSign;
   /*应用名称*/
   2: string appName;
   /*应用图标*/
   3: string appIcon;
   /*应用ID*/
   4: i64 appID;
   /* 应用主页地址 */
   5: optional string appHomeUrl;
   /* 企业ID */
   6: optional i64 entID;
   /* 企业名称 */
   7: optional string entName;
   /* 某种客户端配置*/
   8: optional map<string, string> configItems;
   /* 应用Secret */
   9: optional string appSecret;
   /* 应用Token */
   10: optional string appToken; 
   /* 应用菜单 */ 
   11: optional string appMenus; 
   /* openID是否编码，0:不编码，1:编码*/
   12: optional byte openIDEncoded;
   /* 机器人子账户列表 json格式数据 */
   13: optional string subAccount;
   /* 子类型  1 H5应用，2 移动应用 */
   14: optional byte appSubType;
   /* 推荐 1 是 ，2 否 */
   15: optional byte recommend;
   /* 默认安装 1 是 ，2 否 */
   16: optional byte defaultInstall;
   /* 扩展字段 json 格式，mainUrl H5首页，adminUrl 后台管理地址，myUrl 个人中心地址 */
   17: optional string extend;
   /*设备类型 1(iPhone_E), 2(iPad_E), 3(iPhone), 4(iPad), 5(androidPhone), 6(androidPad)*/
   18: optional string deviceTypes;
   /*消息历史地址*/
   19: optional string messageHistoryUrl;
   /*是否启用自定义菜单   1 启用  0停用*/
   20: optional string menuOpen;
   /*replyMenuOpen是否启用自定义菜单响应事件  1启用 0停用*/
   21: optional string replyMenuOpen;
      /*智能开关 2*/
   22:optional byte appType;
    /*公众号状态*/
   23:optional byte status;
   /*1:订阅号2：企业号 3：应用号*/
   24: optional byte subOrAppType;
   /* 应用功能介绍 */
   25: optional string appFunctintroduce;
   /* 公众号介绍 */
   26: optional string appDescription;
   /* 公众号创建者id  可能是appid也可能是userid*/
   27: optional i64 ownerId;
   /* 应用是否需要强制授权1需要，0不需要 */
   28: byte forceGrant;
   /* 授权介绍 */
   29: string grantIntroduce;
   /* 客服id */
   30: i64 CSID;
}

/**
 * 应用市场分页查询结果
 */
struct AppMarketPage{
   /* 应用列表 */
   1: list<SmallEntAppInfo> apps; 
   /* 总计录数 */
   2: i64 totalCount; 
   /* 总页数 */
   3: i64 totalPage; 
}
/**
 * 应用市场分页查询条件
 */
struct AppMarketQuery{
   /* 页码 */
   1: i32 pageNum;
   /* 页长 */
   2: i32 pageSize;
   /* 应用名称 模糊查询用 */
   3: string appName;
}

struct DelayMessage{
 1:optional i64  delayMsgID;
 //发送者ID
 2:optional i64  sendUserID;
 //接收者ID,人或者群
 3: string receiverIDs;
 //送达消息时间
 4: i64 sendTime;
 //发送消息内容
 5: optional string message;
 //消息类型 1:html 2:文本，3:音频 4: 位置 5:图片6:文件 7:名片 8:弱提示
 6: byte messageType;
 /*内容格式*/
 7: string format;
 /*消息属性*/
 8: optional string msgProperties;
 /*消息事件属性  1：阅后即焚*/
 9: optional byte activeType;
 /*状态 1:待发送  2:发送成功 3:撤销,4:发送失败*/
 10:optional byte status;
  /*创建时间*/
 11:optional i64 createTime;
}
/**
 * 共用返回信息
 */
struct Result{
	1:i32 code;  //是否处理成功
	2:optional string message;  //失败原因
	3:optional i64 result;  //处理的结果
	4:optional i64 result2; // 处理的第二个结果

}
/**
 * 分享设置选项
 */
struct ShareOption{
	/** 1:不允许他看我的分享，2：不看他的分享 */
	1: byte shareType;
	/** 目标用户ID */
	2: i64 targetUserID;
	3: optional i64 SDKID;
}

/** 个人资料开关*/
struct PersonalDataSwitch{
	/** 开关类型：1：生日 2：电话 3：邮件 4：好友验证方式 5：V标(好友，群)提醒模式 6：@相关人提醒模式 7：全局通知消息内容模式*/
	1: byte switchType;
	/** 
	 * switchType: 开关类型 1：生日 2：电话 3：邮件, value: 1：所有人可见 2：仅好友可见 3：仅自己可见，默认1
     *  4：好友验证方式, value: 1：需要验证信息,2:不允许任何人添加,3:允许任何人添加，默认1
     *	5：V标(好友，群)提醒模式, value: 1:表示始终有声音提醒，2：表示始终无声音提醒 3:不始终提醒，默认1
     *	6：@相关人提醒模式, value: 1:表示始终有声音提醒，2：表示始终无声音提醒 3:不始终提醒，默认1
     *  7：全局通知消息内容模式, value: 1:通知详情，2：通知源，隐藏内容 3:完全隐藏，默认2
	 */
	2:optional byte value;
	3:optional i64 SDKID;/* sdkid*/
}
/**
 * 群文件
 */
struct GroupFile{
	/** 文件ID（用的消息ID） */
	1:optional i64 fileID;
	/** 群ID */
	2:i64 groupID;
	/** 上传者ID */
	3:i64 userID;
	/** 页码 */
	4:optional i16 page;
	/** 文件名 */
	5:optional string fileName;
	/** 文件URL */
	6:string fileUrl;
	/** 文件大小 */
	7:optional i64 fileSize;
	/** 是否加密，1：加密 */
	8:optional i32 isEncrypt;
	/** 文件上传时间 */
	9:optional i64 uploadTime;
	/** 密钥 */
	10: optional string secretKey;
	/** SDKID */
	11: optional i64 SDKID;
	/** 文件期限: 1:临时,2:永久 */
	12:byte fileTerm;
}

/**
 * 单聊文件
 */
struct SingleChatFile{
	/** 文件ID（用的消息ID） */
	1:i64 fileID;
	/** 发送者ID */
	2:i64 sendUserID;
	/** 接收者ID */
	3:i64 receUserID;
	/** 文件名 */
	4:optional string fileName;
	/** 文件URL */
	5:optional string fileUrl;
	/** 文件大小 */
	6:optional i64 fileSize;
	/** 是否加密，1：加密 */
	7:optional i32 isEncrypt;
	/** 文件上传时间 */
	8:optional i64 uploadTime;
	/** 密钥 */
	9:optional string secretKey;
	/** SDKID */
	10:i64 SDKID;
}

/** 全局勿扰模式数据协议 */
struct NoDisturbMode{

	/** 开始时间 */
	1:optional i32 startTimer;
	/** 截止时间 */
	2:optional i32 endTimer;
	/** 开关是否打开0为关闭 1为打开 */
	3:optional byte value;
	4:optional i64 SDKID;
	/** 服务端4.6版本,勿扰模式扩展,新版本有多个勿扰时间段 请自行保证数据的顺序*/
	5:optional list<NoDisturbModeExtension> modeList;
}

/** 全局勿扰模式数据协议扩充 */
struct NoDisturbModeExtension{
	/** 开始时间 */
	1:optional i32 startTimer;
	/** 截止时间 */
	2:optional i32 endTimer;
	/** 开关是否打开0为关闭 1为打开 */
	3:optional byte switchType;
	/** 对应时间段勿扰模式名称 */
	4:optional string name;
}
	/** 设置针对某一个人的勿扰模式数据协议 */
struct UserToTargetSwitch{
	/** 目标用户ID */
	1:optional i64 targetUserId;
	/** 类型值
     * 1:个人设置项, value: 1为接收提醒 2表示不提醒仅显示数字 3:为免打扰, 默认1
     * 2:个人通知消息详情模式, value:1、通知详情 2、通知源，隐藏内容 3、完全隐藏 默认开启模式1
     */
	2:optional byte typeValue;
	/**
	 * 类型 1:个人设置项 2:个人通知消息详情模式
     */
	3:byte modeType;
	4:optional i64 SDKID;
}
struct PersonDefinition{
	/** 1表示推送通知提示音 */
	1:byte defType;
	/** defType=1的时候表示提示音的名字 */
	2:optional string value;
	3:optional i64 SDKID;
}
struct ReqVerifyParam {
   1: i64 reqVerifyboxID; /*请求盒子ID*/
   2: i64 reqUserID; /*请求用户ID*/
   3: optional i64 SDKID;
}

/**
 * 消息状态统计信息
 */
struct MessageStatusStatsInfo{
	/* 消息ID */
	1: i64 messageID;	
	/* 各状态的计数 */
	2: optional map<byte, i32> statusMap;
	/* 有无反馈的计数 */
	3: optional map<byte, i32> feedbackMap;
	4: optional i64 SDKID;
}

/**
 * 消息状态详情
 * 普通消息返回哪些人未送达、送达、已读的信息，指令消息返回指令统计（有无来区分）
 */
struct MessageStatusDetailInfo{
	/* 消息ID */
	1: i64 messageID;	
	/* 各状态的情况 key:状态，value:对应状态下的用户id*/
	2: optional map<byte, list<i64>> statusMap;
	/* 有无反馈的计数 */
	3: optional map<byte, i32> feedbackMap;
}

/**
 * 组织公开配置
 */
struct OrgOpenConfig{
	/** 团队ID/企业ID  */
	1: i64 teamID;
	/** 公开的组织ID  */
	2: i64 openOrgID;
	/** 目标组织ID  */
	3: list<i64> targetOrgIDs;
	4: optional i64 SDKID;
}

/**
 * 团队用户查询参数
 */
struct EnterpriseUserQueryParam{
	/* 用户名称*/
	1: optional string username;
	/* 企业ID*/
	2: optional i64 entID;
	/* 组织架构ID*/
	3: optional i64 entOrgID;
	/* 分页页码*/
	4: optional i32 pageNo;
	/* 分页每页大小*/
	5: optional i32 pageSize;
	/* 企业用户ID*/
	6: optional i64 entUserID;
	/* 业务状态，1：默认，2：在高管层*/
	7: optional byte bizStatus;
	/* 企业用户状态*/	
	8: optional byte status;
}

struct EnUserStruct{
	/*企业用户信息的list*/
	1:list<EnterpriseUserBean> EnterpriseUserList;
	/*总记录数*/
	2:i64 total;
	/*总页数*/
	3:i64 totalPage;
}
/**
 * 检索参数
 */
struct SearchParam{
	/* 条件 */
	1: string condition;
	/* 类型：0：所有，1：组织架构，2：人员 */
	2: optional byte type;
	/* 地区项：0：全国，1：新疆 */
	3: optional i32 area;
	/* 扩展字段：第一个string为字段名，第二个string为字段对应的值 */
	4: optional map<string, string> extendParam;
}
/**
 * 检索结果
 */
struct SearchOrgAndUserResult{
	1: optional list<OrganizationBean> orgs;
	2: optional list<EnterpriseUserBean> users;
}
 /**
  ***********地址解析返回结构体***********************************
 */
 struct UrlContent{
   /*url地址*/
   1:string url ;
   /*解析的标题*/
   2:optional string title;
   /*解析的图片地址*/
   3:optional string img;
   /*解析的摘要*/
   4:optional string description;
   /* 成功或失败标识符  0:成功  170：失败 */
   5:optional i32 code;
 }
 
 /**
 * 用户查询参数
 */
struct UserQueryParam{
	/* 表名ID*/
	1: optional string tableName;
	/* 表的序号ID*/
	2: optional i32 tableSerial;
	/* 分页页码*/
	3: optional i32 pageNo;
	/* 分页每页大小*/
	4: optional i32 pageSize;
		/* SDKID */
	5: optional i64 SDKID;
}

/**
 * 用户注册参数
 */
struct RegisterParam{
	1: optional list<AccountType> accounts;
	2: optional string pwd;
	3: optional string name;
	4: optional byte sex; 
	5: optional byte status;  /*状态 1：正常 2：停用 3: 注册邀请*/
	6: optional i64 SDKID;
	7: optional byte pwdStrength;/*密码强度:1:弱,2:中,3:强*/
	8: optional string entExtend;/*企业扩展信息*/
	9: optional string orgID;/*组织结构id,多个用逗号分隔*/
    10: optional i64 roleID;/*角色ID*/
    11: optional byte bizStatus;/*业务状态，1：初始默认，2：在高管层*/
    12: optional string portraitURL; /*头像地址*/
	13: optional string phoneNum; /*电话号码*/
	14: optional string email; /*邮箱*/
	15: optional string realname; /*真实姓名*/
	16: optional string tagIds; /*用户标签id,多个用逗号分隔*/
}

struct GroupPage{
	/** 页码 */
	1: i32 pageNo;
	/** 每页条数 */
	2: i32 pageSize;
	/** 总页数 */
	3: i64 totalPage;
	/** 总条数 */
	4: i64 totalCount;
	/** 条目 */
	5: list<GroupInfo> items;
}

struct GroupSearchParam{
	/** 页码 */
	1: i32 pageNo;
	/** 每页条数 */
	2: i32 pageSize;
	/** 群名称 */
	3: optional string groupName;
	/** 警种ID */
	4: optional string policeTypeID;
	/** 地域---省份ID */
	5: optional string provinceID;
	/** 地域---市ID */
	6: optional string cityID;
	/** 扩展查询，上面没有的查询调节可以以key,value的形式放入这里,key是群接口提对应的属性名称,上面的3,4,5,6也可以放入此处  */
	7: optional map<string,string> queryCondition;
}

/** 个人资料开关*/
struct NewPersonalDataSwitch{
	1:i64 currentUserId;
	2:i32 switchType;/** 类型 */
	3:optional string value;
	4:optional i64 SDKID;
	5:optional string extendValue;/** 扩展字段，目前，全局勿扰中使用此字段，里面存储的startTimer,endTimer组成的json*/
}
struct EnterpriseDictionary{
	1:i32 id;
	2:i32 parentId;
	3:string dicValue;
	4:string dickey;
	5:string extend;/** 扩展字段，格式为{"isEdit":0,"isFriend":0,"isInput":0,"isLogin":0,"isShow":0,"isStrange":0},isEdit:是否客户端可编辑;isFriend:客户端是否好友可见;isInput:是否必填字段;isLogin:是否登录项字段;isShow:客户端组织架构是否可见;isStrange:客户端是否陌生人可见*/
	6:i32 orderNum; /**排序专用字段 */
}
struct EnterpriseDictionaryStruct{
1:list<EnterpriseDictionary> enDics;
/*总记录数*/
2:i64 total;
/*总页数*/
3:i64 totalPage;
}

struct SmallUserPage{
	/*用户信息的list*/
	1:list<SmallUserBean> userList;
	/*总记录数*/
	2:i64 total;
	/*总页数*/
	3:i64 totalPage;
	/** 页码 */
	4: i32 pageNo;
	/** 每页条数 */
	5: i32 pageSize;
}

struct FaceJoinGroup{
  /*用户ID*/
  1: i64 userID; 
  /*经度*/
  2: double longitude;   
  /*纬度*/
  3: double latitude;
  /*房间密码*/
  4: optional string password;
  /*sdkID*/
  5: i64 SDKID;
  /*操作: 1:建群,2:加好友*/
  6: byte operation;
}
struct FaceJoinGroupResult{
  /*1：加入或者创建成功，2：创建失败，精度、纬度、房间密码不符合要求 3：已与房主是好友关系, 4:房间不存在*/
  1: byte result;
  /*房间ID*/
  2: optional string roomID; 
  /*返回此房间的用户列表，主要信息用户ID,用户名，图像，如果是近距离加好友只返回房主用户信息*/
  3: optional list<SmallUserBean> userList;
  /*sdkID*/
  4: i64 SDKID;
  /*随机码,创建房间时返回*/
  5: optional string randomCode;
}

struct EmoticonErrorResult{
   /**
    *801:md5Code不存在
    *802：md5Code文件已存在
	*/
   /*结果编码*/
   1: i32 resultCode;
   /*结果信息*/
   2: optional string resultMessage;
    /*表情code*/
   3: optional string mdCode;
   /*排序*/
   4: i32 orderNum
}

struct EmoticonOPResult{
   /**
    *0:操作成功
    *801:md5Code不存在
    *802：md5Code文件已存在
    *803：批量新增表情失败
	*/
   /*结果编码*/
   1: i32 resultCode;
   /*结果信息*/
   2: optional string resultMessage;
   /*批量成功ID记录*/
   3: optional list<EmoticonErrorResult> successList;
   /*批量失败ID记录*/
   4: optional list<EmoticonErrorResult> failList;
}


struct Emoticon{
   /*md5code 整个文件的MD5hashcode码*/
   1:optional string mdCode;
   /*表情描述*/
   2:optional string depict;
   /*表情创建人*/
   3:optional i64 userID;
   /*创建时间*/
   4:optional i64 createTime;
   /*表情Url*/
   5:optional string mainUrl;
   /*表情属性 1：系统自带2：用户上传*/
   6:optional byte property;
   /*表情状态 1：草稿2：发布3：删除*/
   7:optional byte emoStatus;
   /*关联表情包Code*/
   8:optional string packageCode;
   /*表情类型 1：静态表情2：动态表情*/
   9:optional byte type;
   /*表情类目 1人物 2情侣 3动物 4食物 5节日 6网络热点 7征稿活动 8其他*/
   10:optional byte category;
   /*表情标签  多个标签用分隔符分开，web端自己定义自己解析，服务只做存储*/
   11:optional string label;
   /*缩略图url*/
   12:optional string thumbnailUrl;
   /*表情含义*/
   13:optional string meaning;
   /*排序字段*/
   14:optional string orderNum;
   /*扩展字段1*/
   15:optional string extendFiled;
   /*扩展字段2*/
   16:optional string extendColumn;
}

struct EmoticonPackage{
   /*md5 code 整个文件的MD5hashcode码*/
   1:optional string mdCode;
   /*表情描述*/
   2:optional string depict;
   /*表情创建人*/
   3:optional i64 userID;
   /*创建时间*/
   4:optional i64 createTime;
   /*表情Url*/
   5:optional string mainUrl;
   /*表情属性 1：系统自带2：用户上传*/
   6:optional byte property;
   /*表情状态 1：草稿2：发布3：删除*/
   7:optional byte packStatus;
   /*表情包名称*/
   8:optional string name;
   /*详细页横幅URL*/
   9:optional string bannerUrl;
   /*表情包内表情类型 1：静态表情2：动态表情*/
   10:optional byte type;
   /*表情包类目 1人物 2情侣 3动物 4食物 5节日 6网络热点 7征稿活动 8其他*/
   11:optional byte category;
   /*表情包标签  多个标签用分隔符分开，web端自己定义自己解析，服务只做存储*/
   12:optional string label;
   /*图标url*/
   13:optional string iconUrl;
   /*封面URL*/
   14:optional string coverUrl;
   /*表情包说明*/
   15:optional string instruction;
   /*排序字段*/
   16:optional string orderNum;
   /*扩展字段1*/
   17:optional string extendFiled;
   /*扩展字段2*/
   18:optional string extendColumn;
   /*关联表情，格式json-list<map>*/
   19:optional string emoticonListJson;
   /*版本号*/
   20:optional string version;
}

/**
 * 表情设置分页数据
 * 分页参数和结果分页共用
 */
struct EmoticonPackagePage{
	/** 请求页码  */
	1: optional i32 pageNum;
	/** 每页大小  */
	2: optional i16 pageSize;
	/** 总页数  */
	3: optional i64 totalPage;
	/** 总条数  */
	4: optional i64 totalItems;
	/** 当前页数据  */
	5: optional list<EmoticonPackage> items;
	
	6: i64 SDKID;
}

/**
 * 应用市场信息
 */
struct SmallMarketAppInfo{
	/*应用ID*/
   1: optional i64 appID;
   /*应用标识*/
   2: string appSign;
   /*应用名称*/
   3: string appName;
   /*应用图标*/
   4: string appIcon;

   /* 企业ID */
   5: i64 entID;

   /* 状态 1启用，2停用，3删除*/
   6: optional byte status;
   /* 应用功能介绍 */
   7: optional string appFunctintroduce;

   /* 版本号 */
   8: optional string version;

   /* 所有者id */
   9: optional i64 ownerId;

   /* 类型：1(H5应用), 2(IOS应用), 3(Android应用), 4(内部应用), 5(快捷应用) */
   10: optional byte appType;

   /* 默认安装 1 是 ，2 否 */
   11: optional byte defaultInstall;

   /* 个人安全中心是否展示 1 是 ，2 否 */
   12: optional byte showInMy;

   /*H5首页 */
   13: optional string mainUrl;

   /*后台管理地址*/
   14: optional string adminUrl;

   /*个人中心地址*/
   15: optional string myUrl;

   /*包名*/
   16: optional string packageName;

   /*下载地址*/
   17: optional string downloadUrl;

   /*urlScheme*/
   18: optional string urlScheme;

   /*快捷应用地址*/
   19: optional string quickUrl;

   /* 扩展字段*/
   20: optional string extend;

   /*activity*/
   21: optional string activityName;
   /*  应用来源 1：后台管理应用 2：开放平台应用 */
   23: optional byte sourceType;
   /* 应用对应的应用号id 对应SmallEntAppInfo中的appID*/
   24: optional i64 vestAppID;
   /* 应用分类id 对应SmallMarketAppType中的appTypeID*/
   25:optional i64 appTypeID;
   /* 应用分类名称 对应SmallMarketAppType中的appTypeName*/
   26:optional string appTypeName;
   /* 进程名 2020-04-09 v5.4版本新增应用类型6(Windows应用) */
   27: optional string processName;
}

/**
 * 应用市场分页查询条件
 */
struct SmallMarketAppQueryParam{
	/*页码*/
	1:optional i32 pageNum;
	/*页长*/
	2:optional i32 pageSize;
	/*类型 1(pc) 2(IOS), 3(Android)*/
	3:optional i32 deviceType;
	/*用户ID*/
	4:optional i64 userID;
	/*应用名称，模糊查询用*/
	5:optional string appName;
}
/**
 * 应用市场分页查询结果
 */
struct SmallMarketAppPage{
    /*页码*/
	1:optional i32 pageNum;
	/*页长*/
	2:optional i32 pageSize;
	/*总数*/
	3:optional i32 count;
	/*总页数*/
	4:optional i32 totalPage;
	/*应用列表*/
	5:optional list<SmallMarketAppInfo> marketAppInfos;
}

/**
 * 账户绑定
 */
struct AccountBinding{
    /** 用户ID  */
    1: i64 userID;
    /** 账号类型  */
    2: AccountType accountType;
    /** 操作: 1:绑定,2解绑  */
    3: byte operation;
    4: i64 SDKID;
    /** 当前系统语言: 如zh_CN, en_US等  */
    5: string lang;
}

/**
 * 操作日志
 */
struct OperationLog{
	/*操作日志ID*/
   1: optional i64 logId;
   /*操作类型：1新增2修改3删除*/
   2: optional i32 type;
   /*操作人id*/
   3: optional i64 adminId;
   /*操作人名称*/
   4: optional string adminName;

   /* 业务描述 */
   5: optional string businessName;

   /* 表名*/
   6: optional string tableName;
   /* 返回结果 */
   7: optional string result;
	/* 返回结果类型 */
   8: optional i32 resultType;
   /* 创建时间戳 */
   9: optional i64 createAt;
   /* 预留字段 */
   10: optional string extend;
   /* 业务描述 英文版*/
   11: optional string businessName_EN;
   /* 是否阅读*/
   12: optional i32 isRead;
   /* 角色ID*/
   13: optional i64 roleID;
   /*组织机构ID*/
   14: optional string orgCode;
   /* 模块操作类名*/
   15: optional string modelClassName;
   /* 模块操作方法*/
   16: optional string modelMethodName;
   /* 模块操作者IP*/
   17: optional string ipAddr;
   /* 模块操作者所在部门*/
   18: optional string orgName;
}
/**
 * 操作日志分页查询结果
 */
struct OperationLogPage{
    /*页码*/
	1:optional i32 pageNum;
	/*页长*/
	2:optional i32 pageSize;
	/*总数*/
	3:optional i32 count;
	/*总页数*/
	4:optional i32 totalPage;
	/*操作日志列表*/
	5:optional list<OperationLog> logs;
}

/**
 * 操作参数日志
 */
struct OperationLogArgs{
	/*操作参数日志ID*/
   1: optional i64 argsId;
   
   2: optional i64 logId;
  
   /*参数名称*/
   3: optional string argsKey;

   /* 参数值 */
   4: optional string argsValue;

   /* 参数类型*/
   5: optional string argsType;

   /* 创建时间戳 */
   6: optional i64 createAt;

   /* 预留字段 */
   7: optional string extend;
}

/**
 * 操作参数日志分页查询结果
 */
struct OperationLogArgsPage{
    /*页码*/
	1:optional i32 pageNum;
	/*页长*/
	2:optional i32 pageSize;
	/*总数*/
	3:optional i32 count;
	/*总页数*/
	4:optional i32 totalPage;
	/*操作日志列表*/
	5:optional list<OperationLogArgs> ArgsLogs;
}
/**
 * 应用市场logo图片
 */
struct BannerMarketBean{
	1:string title;
	2:string imgUrl;
}

/**
 * SDK用户
 */
struct SDKUser{
	1: string account; /* 帐号 */
	2: optional string pwd;/* 密码 */
	3: optional byte pwdStrength;/*密码强度:1:弱,2:中,3:强*/
}
/**
 * UserService.getLoginAuthCode参数
 */
struct LoginAuthParam{	
	1: string appID; /* 应用ID */	
	2: string userID; /* 用户ID */
	3: optional string account; /* 登录账号*/	
	4: string accountType; /* 账户类型*/	
	5: optional string password; /* 账户类型*/
	
}

/**
*客户端分页获取企业号 查询参数类
**/
struct SmallEntAppInfoQueryParam{
  1: i32 pageNum;//页码
  2: i32 pageSize;//每页大小
  3: byte status;//状态
  4: i64 userID;//登录用户id
  5: optional i64 entID;//企业ID
}

/**
*客户端分页获取企业号 返回类型
**/
struct SmallEntAppPage{
  1: i64 totalCount;//总数量
  2: i64 totalPage;//总页数
  3: list<SmallEntAppInfo> appList;//企业号集合
}

/**
* oauth2.0认证用户信息
**/
struct AuthUserBean{
  1: optional i64 userID; /*用户ID*/
  2: optional string name; /*用户名 */
  3: optional byte sex; /* 性别*/
  4: optional string area; /*区域 */
  5: optional YMD birthday; /*生日*/
  6: optional string school;  /*毕业学校*/
  7: optional string portraitURL; /*头像地址*/
  8: optional list<string> phoneNums;  /*电话号码清单*/
  9: optional list<string> emails; /*邮箱清单 */
}

/**
 * 用户账户
 */
struct UserContact {
	1:byte type; /* 1.电话号码 3.email 4.userID 6.accountName*/
	2:string contactInfo; /* 帐号名称*/
	3:byte status; /* 1.启用， 2.禁用, 5.锁定, 6.冻结 */
	4:i64 SDKID; /* SDKID*/
	5:optional string mark; /* 标识*/
	6:optional i64 userID; /* 用户ID*/
}


/**
  * 开放平台应用安装应用的用户表
  */
 struct InstallMatketUser{
    1:optional i64 appID;//应用id
    2:optional i64 userID;//用户id
    3:optional i64 vestAppID;//应用号id
    4:optional i64 createDt;//创建时间
    5:optional i64 updateDt;//修改时间
    6:optional byte status;//状态1：正常，2：删除
    7:optional byte whiteStatus;//1：白名单，2：普通
  }
  /**
  * 应用市场应用分类
  */
  struct SmallMarketAppType{
    1:optional i64 appTypeID;//应用分类id
    2:optional string appTypeName;//应用分类名称
  }
  
  
 /**
  * 全文检索动态查询参数对象
  */
  struct DynamicQueryParam {
	1: optional string paramKey; /*参数名*/
	2: optional string logicType; /*查询逻辑 1.是 2.否*/
	3: optional string searchType; /*查询类型 1.精确 2.模糊 3.前缀  4.包括*/
	4: optional list<string> paramValues; /*参数值*/
	5: optional string nestedPath; /*嵌套主字段*/
  }

 /**
  * 全文检索动态查询排序对象
  */
  struct OrderFiledParam {
	1: optional string filedName; /*排序字段名*/
	2: optional string orderType; /*排序方式 1.asc 2.desc*/
	3: optional string nestedPath; /*嵌套主字段*/
	4: optional string missType; /*无排序字段处理方式 1.前置 2.后置*/
	5: optional list<DynamicQueryParam> filterParam; /*过滤条件*/
  }

 /**
  * 全文检索动态查询分页查询参数对象
  */
  struct DynamicSearchPageParam {
	1: i32 pageNo; /*分页页码*/
	2: i32 pageSize; /*分页大小*/
	3: i32 type; /*索引类型 0：所有，1：组织架构，2：人员*/
	4: optional list<DynamicQueryParam> params; /*动态参数类型*/
	5: optional list<OrderFiledParam> orderFileds; /*排序字段*/
	6: optional list<string> selectFileds;/*查询字段，不填默认全部返回*/
  }
  
  struct FullSearchPageResult { 
	/**
	 *****查询第几页****
	 */ 
	1: i32 pageNo;
	/**
	 *****查询每一页对应多少条数据****
	 */
	2: i32 pageSize;
	/**
	 *****符合条件的数据量****
	 */
	3: i64 totalCount;
	/**
	 *****符合条件的数据总共页数****
	 */
	4: i64 totalPage;
	/**
	 ***** 符合条件的查询结果****
	 * 
	 * 目前： 查询用户全文检索，resultList中装载的内容为 json字符串，对应SmallUserBean，调用方根据SmallUserBean解析其中内容
	 */	
	5: list<string> resultList;
	/**
	 ***** 符合条件的查询结果****
	 * 
	 * 目前： 查询用户全文检索，resultList中装载的内容为 用户ID，由于存在一个用户多个组织，所以会获取到一个用户的多个相同的id，如果需要去重复，请自行处理
	 */	
	6: optional list<i64> userIDs;
}


struct OnlineExt {
	1:optional i64 userID; //用户ID
	2:optional i64 SDKID; //SDKID
	3:optional string extJSON;//ext
	4:optional byte deviceType;//设备类型
}



/**
 * 邀请码参数
 */
struct InviteCodeParam{
	1:i64 createUserID;//好友邀请码时这里为userID;群邀请码时这里为groupID（邀请码验证通过后,会加userID为好友,或者加入群groupID）
	2:i32 digit;//生成邀请的位数
	3:i64 effectiveSeconds;//有效秒数（默认一个月） 
	4:i32 effectiveCount;//有效次数（默认无数次，数据库里存-1）
	5:list<UserContact> consumeAccount;//有效账号（不传时默认任何账号都能使用）
  7: optional string extData // 验证码拓展字段
}

/**
 * 邀请码返回结果对象
 * code:
 *		0：成功
 *		101：邀请码位数参数digit错误
 *		102：邀请码生成者参数createUserID错误
 *		103：邀请码有效秒数参数effectiveSeconds错误
 *		104：邀请码有效次数参数effectiveCount错误
 *		105：接口参数为空
 *		106：邀请码生成出错
 *		107：邀请码入库失败
 *		108：邀请码无效
 *		109：邀请码使用者账户参数consumeAccount错误
 *		110：邀请码id参数inviteCodeID错误
 *		111：邀请码使用者参数consumeUserID错误
 *		112：邀请码使用记录入库失败
 *		113：邀请码生产者入库失败
 *		114：邀请码生产者删除失败
 *		115：该用户没有生成邀请码的权限
 *		116：邀请码有效，但此账号不能使用
 */
struct InviteCodeResult{
	1:i32 code;//返回码
	2:string message;//结果信息
}

struct NetInfoBean{
	1:optional i64 vrvID;//豆豆ID
	2:optional i32 type;//ID类型：1好友 2群 3群成员 4用户
	3:optional string netUserID; //外联userID
	4:optional string nodeID; //节点名
}

/****
* 
*  意见反馈对象	
*
*/
struct Feedback{
	/* 主键id */
	1:i32 id;
	/* 问题id (1：崩溃；2：掉线；3：卡顿；4：其他问题；5：改进建议)*/
	2:i32 questionID;
	/* 问题名称 */
	3:string questionName;
	/* 问题描述  */
	4:string questionDescription;
	/* 是否必现 (1：是；2：否) */
	5:i32 isNecessary;
	/* 操作系统 1:安卓、2:IOS、3:Windows、4:MAC、5:网页 */
	6:string operatingSystem;
	/* 客户端版本  */
	7:string clientVersion;
	/* 反馈人id  */
	8:i64 feedbackPersonID;
	/* 反馈人名称  */
	9:optional string feedbackPersonName;
	/* 反馈人所在组织机构  */
	10:optional string feedbackPersonOrg;
	/*  提交时间 */
	11:string createDate;
	/* 反馈截图  (最多四张，以英文分号（;）隔开)*/
	12:optional string screenPic;
	/* 日志地址 */
	13:optional string logUrl;
	/* 操作系统版本 */
	14:string operatingSystemVersion;
}

/**
 * 收藏bean
 */
struct CollectionBean{
	1: i64 collectionID;/* 收藏ID*/
	2: string fileName;/* 文件名称*/
	3: string message;/* 消息内容*/
	4: byte messageType; /*类型: 1:文字，2:图片，3:文件，4:链接，5:语音，6:其他*/
	5: string msgProperties;/* 消息属性*/
	6: i64 groupID;/* 所属群ID*/
	7: i64 collectUserId;/* 收藏用户的id*/
	8: i64 messageUserId;/* 消息用户id*/
	9: byte devicetype; /*设备类型: 1:PC,2:手机,3:pad,4:网页*/
	10: i64 createTime;/* 创建时间*/
	11: string exts;/* 扩展字段*/
	12: i64 SDKID;
}

struct CollectionResultBean{
   /**
   	* 0;//成功
    * 100022001;//参数错误
	* 100022002;//收藏用户id不能为空
	* 100022003;//保存文件到云盘失败
	* 100022004;//保存数据失败
	* 100022005;//删除数据失败
	* 100022006;//该收藏信息不存在
	* 100022007;//该收藏id不能为空
    */
   /*结果编码*/
   1: i32 resultCode;
   /*结果信息*/
   2: optional string resultMessage;
}

/**
 * 收藏分页返回
 */
struct CollectionBeanStruct{
	1:list<CollectionBean> collects;
	/*总记录数*/
	2:i64 total;
	/*总页数*/
	3:i64 totalPage;
	/*结果*/
    4:optional CollectionResultBean result;
}

struct OperateCollectionResult{
   /*结果*/
   1: CollectionResultBean result;
   /*收藏信息*/
   2: optional CollectionBean collection;
}

/**
* 工作台轮播图实体 返回类型
**/
struct WorkBenchBanner{
  1: string id;//主键
  2: string title;//标题
  3: string cover;//封面(只支持jpg、png)
  4: i32 type;//类型（1：外链，2非外链）
  5: string displayType;//展示设备类型（1：安卓，2：ios）
  6: i32 displayStatus;//显示状态（1：显示，2：隐藏）
  7: string linkUrl;// 外链地址
  8: string detailUrl;// 详情地址（外链类型地址-完整路径；非外链类型地址-存轮播图详情页的相对地址）- 客户端使用
  9: string content;//富文本内容
  10: i32 sortNum;//排序
  11: i64 createTime;//创建时间
  12: i64 updateTime;//更新时间
}

/**
* 官网轮播图实体 返回类型
**/
struct HomeConfigBanner{
  1: string id;//主键
  2: string title;//标题
  3: string content;//标题底部详细说明
  4: string url;//封面(只支持jpg、png)
  5: i32 displayStatus;//显示状态（1：显示，2：隐藏）
  6: i32 type;//类型（1：外链，2非外链）
  7: string linkUrl;// 外链地址
  8: i32 sortNum;//排序
  9: i64 createTime;//创建时间
  10: i64 updateTime;//更新时间
}

/**
 * 消息未读数实体
 */
struct MsgUnreadCounter{
	1:optional i64 messageID;//消息
	2:optional i32 unreadCount;//消息未读数
	3:optional i32 maxUnreadCount;//最大未读数
	4:optional i64 snapshotID;//群快照
}

/**
 * 快照
 */
struct Snapshot{
	1:optional i64 snapshotID;//快照主键
	2:optional string snapshotInfo;//快照详情
	3:optional i64 creatAt;//创建时间
	4:optional i64 SDKID;//SDKID
	5:optional list<i64> userIds;//群成员
}

/**
* 工作台轮播图分页实体 返回类型
**/
struct WorkBenchBannerPage{
  1: i64 totalCount;//总数量
  2: i64 totalPage;//总页数
  3: list<WorkBenchBanner> bannerList;//轮播图集合
}

/**
 * 帮助系统
 */
struct SystemHelp{
    /* 帮助ID */
    1:i64 id;
    /* 标题*/
    2:optional string title;
    /* 父ID*/
    3:i32 parentId;
    /* 帮助类别*/
    4:i32 helpType;
    /* 外链类型*/
    5:i32 linkType;
    /* 客户端类型*/
    6:optional string clientType;
    /* 显示状态*/
    7:i32 displayStatus;
    /* 外链地址*/
    8:optional string linkUrl;
    /* 详情地址*/
    9:optional string detailUrl;
    /* 富文本内容*/
    10:optional string content;
    /* 排序值(正整数)-升序排序*/
    11:i32 sortNum;
    /*创建时间*/
    12:i64 createTime;
    /*修改时间*/
    13:i64 updateTime;
    /* 状态 */
    14:i32 status;
}


/**
 * 用户行为
 **/
struct UserBehavior{
  1: optional i64 userID;//用户id
  2: optional string name;//昵称
  3: optional byte operateType;//操作类型:1.登录,2.登出,3.单聊,4.群聊
  4: optional i64 targetID;//目标方id（目前可能为用户id或者群id）
  5: optional string targetName;//群名、用户名
  6: optional byte operateResult;//操作结果:1：成功,2：失败
  7: optional string extend;//拓展信息：聊天：{messageType：1}1：阅后即焚消息2：文字消息3：语音消息4：阅后回执消息5：图片6：文件7：名片消息8：延迟消息;登录登出：{deviceType：1}1：IOS2：ANDROID3：PC
  8: optional i64 operateAt;//操作时间
}

/**
 * 好友请求
 */
struct BuddyVerifyRequest{
	/*申请人ID*/
	1: i64 userId;
	2: i64 SDKID;
	/*好友ID*/
	3: i64 buddyId;
	/*验证消息*/
	4: optional string message;
	/* 好友请求1 好友关注2 */
	5: i32 requestType;
	/*好友请求子类型:201*/
	6: i32 subMsgType;
	/*设备类型：参考MessageBean  1：PC 2：手机 3：pad 4：网页*/
	7: byte deviceType;
} 
/**
 * 好友响应
 */
struct BuddyVerifyResponse{
	/* 响应人ID */
	1: i64 userId;	
	/* 申请单号 */
	2: i64 applicationId;
	/* 验证消息 */
	3: optional string message;
	/* 好友请求:1 */
	4: i32 requestType;
	/* 好友请求子类型: 同意 202 拒绝203*/
	5: i32 subMsgType;
	/* 1: 注册邀请 */
	6: optional byte inviteMark;
	7: i64 SDKID;
	/*设备类型：参考MessageBean  1：PC 2：手机 3：pad 4：网页*/
	8: byte deviceType;	
	/* 注册邀请时，好友ID */
	9: optional i64 buddyId;
} 
/**
 * 好友返回
 * 
 * 状态码：
 *		100 参数错误
 *		132 对方不允许陌生人加好友
 *		134 你们已经是好友关系
 *		135 你已经关注了他
 *		136 请求已发出,等待对方处理
 *		142 添加好友成功
 *		143 关注成功
 *		144 请求已被处理 
 *		146 拒绝你的好友请求
 *		162 已经把此用户拉入黑名单
 *		163 已经被此用户拉入黑名单
 *		164 添加好友失败
 *		165 关注失败
 *		170 请求记录不存在
 *
 */
struct BuddyResult{
	/* 消息码 */
	1: i32 code;
	/* 消息内容 */
	2: optional string message;
	/* 好友分页时间戳 */
	3: i64 pagetimestamp;
	/* 好友页码 */
	4: i16 page;	
} 

/**
 * 群申请
 */
struct GroupVerifyRequest{
	/* 操作人 */
	1: i64 userId;	
	/* 群ID */
	2: i64 groupId;
	/* 进群理由 */
	3: optional string message;
	/* 子消息类型：申请入群301 */
	4: i32 subMsgType;
	5: i64 SDKID;
	/*设备类型：参考MessageBean  1：PC 2：手机 3：pad 4：网页*/
	6: byte deviceType;
} 

/**
 * 群响应
 */
struct GroupVerifyResponse{
	/* 响应人ID */
	1: i64 userId;	
	/* 群ID */
	2: i64 groupId;
	/* 申请单号 */
	3: i64 applicationId;
	/* 响应消息 */
	4: optional string message;	
	/* 子消息类型：同意入群302  拒绝303*/
	5: i32 subMsgType;
	6: i64 SDKID;
	/*设备类型：参考MessageBean  1：PC 2：手机 3：pad 4：网页*/
	7: byte deviceType;
} 


/**
 * 邀请进群请求
 */
struct GroupInviteRequest{
	/* 邀请人ID */
	1: i64 userId;	
	/* 群ID */
	2: i64 groupId;
	/* 被邀请人集合 */
	3: set<i64> inviteUserIds;
	/* 请求消息 */
	4: optional string message;	
	/* 子消息类型：401 邀请入群*/
	5: i32 subMsgType;
	6: i64 SDKID;
	/*设备类型：参考MessageBean  1：PC 2：手机 3：pad 4：网页*/
	7: byte deviceType;
} 

/**
 * 邀请进群响应
 */
struct GroupInviteResponse{
	/* 响应人ID */
	1: i64 userId;
	/* 群ID */
	2: i64 groupId;
	/* 申请单号 */
	3: i64 applicationId;
	/* 响应消息 */
	4: optional string message;	
	/* 子消息类型：同意入群402  拒绝403*/
	5: i32 subMsgType;
	6: i64 SDKID;
	/*设备类型：参考MessageBean  1：PC 2：手机 3：pad 4：网页*/
	7: byte deviceType;
} 

/**
 *  群解散
 */
struct GroupDissolveRequest{
	/* 操作人ID*/
	1: i64 userId;
	/* 群ID */
	2: i64 groupId;	
	/* 附加消息 */
	3: optional string message;	
	/* 子消息类型：解散群503*/
	4: i32 subMsgType;
	5: i64 SDKID;
	/*设备类型：参考MessageBean  1：PC 2：手机 3：pad 4：网页*/
	6: byte deviceType;
	/*群名称*/
	7: string groupName;
	/*通知人员*/
	8: set<i64> noticeUserIds;
}

/**
 *  退出群
 */
struct GroupMemberExitRequest{
	/* 操作人ID*/
	1: i64 userId;
	/* 群ID */
	2: i64 groupId;	
	/* 附加消息 */
	3: optional string message;	
	/* 子消息类型：退出群 504*/
	4: i32 subMsgType;
	5: i64 SDKID;
	/*设备类型：参考MessageBean  1：PC 2：手机 3：pad 4：网页*/
	6: byte deviceType;
}

/**
 *  踢出群
 */
struct GroupMemberKickoutRequest{
	/* 操作人ID*/
	1: i64 userId;
	/* 群ID */
	2: i64 groupId;
	/* 被踢出群成员ID集合 */
	3: set<i64> kickoutUserIds;
	/* 附加消息 */
	4: optional string message;	
	/* 子消息类型：踢出群成员 501*/
	5: i32 subMsgType;
	6: i64 SDKID;
	/*设备类型：参考MessageBean  1：PC 2：手机 3：pad 4：网页*/
	7: byte deviceType;
}

/**
 * 群返回
 *0:操作成功
 *301:没有权限创建群
 *302:有权限创建群
 *303:该用户创建该级别的群已经超过数量限制。
 *304:没有权限修改群信息
 *305:没有权限删除群信息
 *306:该群存在
 *307:该群不存在
 *308:没有权限激活该群
 *309:该用户不是该群成员
 *310:该群级别，群成员已满
 *311:该群级别，群成员未满
 *312:不是超级管理员不能解散该群
 *313:不是管理员不能删除群成员
 *314:不能删除群超级管理员
 *315:超级管理员不能主动退出群，必须先指定超级管理员
 *316:非管理员不能，添加群成员。
 *317:该用户不是该群成员，不能发出邀请
 *318:该群不允许普通人员，邀请。
 *319:该群已经满员，不能再发邀请
 *320:不存在该邀请信息！
 *321:存在该邀请信息，但已经处理！
 *322:邀请人已经不在该群里面，邀请信息处理失效！
 *323:该群不允许任何人添加！
 *324:提示验证请求信息不存在编码！
 *325:验证请求已经处理！
 *326:邀请请求处理成功，请需要发送验证请求！
 *327:处理人已经不在该群里面！
 *328:不是群管理员，不能处理验证请求！
 *329:不是管理员，不能修改其他人群名片!
 *330:不是群成员，不能查看其他人群名片!
 *331:不是群超级管理员，不能转让该群!
 *332:不是群成员，不能转让该群给他!
 *333:您已经在群里面，不能再发验证请求!
 *334:非临时群不允许普通用户邀请。
 *335:不是群超级管理员，不能设置群管理员。
 */
struct GroupResult{
	/* 消息码 */
	1: i32 code;
	/* 消息内容 */
	2: optional string message;
	/* 群分页时间戳 */
	3: optional map<i16,i64> groupPageTimestampMap;
	4:optional list<i64> joinMemberIds;
	/* 申请人ID（邀请人ID） */
	5:optional i64 userID;
	/* 邀请入群时，入群邀请需要自己同意的用户集合*/
	6:optional list<TinyUserBean> inviteVerifyUserList;
	/* 邀请入群时，不接受入群邀请用户集合*/
	7:optional list<TinyUserBean> inviteNotAllowUserList;
	/* 邀请入群时，直接可以进群用户集合*/
	8:optional list<TinyUserBean> inviteAddUserList;
	/* 邀请入群时，入群邀请需要管理员同意用户集合*/
    9:optional list<TinyUserBean> inviteAdminVerifyUserList;
} 

// 敏感词数据 
struct Words {
    1: optional string word  // 敏感词 
    2: optional byte oper      // 操作类型 1 新添加 2 需要删除
    3: optional i64 id  // 敏感词id
    4: optional i64 sid // 所属词库id

}

/*
 *客户端原生应用获取授权码
 *resultCode:
 *100008000 服务异常
 *100008002 获取临时授权码失败
 *100008001 应用不合法
 *0 成功
 */
struct AuthCodeResult{
   /* 返回状态码 */
   1: i32 resultCode;
   /* 临时授权码 */
   2: string authCode;
   /* 应用名称 */
   3: string appName;
   /* 应用图标 */
   4: string appIcon;
   /* 授权范围、列表（目前默认：1） */
   5: i32 scope;
   /* 静默授权 1开，2关*/
   6: optional byte silentAuth;
}
struct AuthCodeParam{
   /* 操作类型 */
   1: i64 appID;
   /* 用户id */
   2: i64 userID;
   /**客户端类型：2（android），3（ios）**/
   3: byte clientType;
   /*android的包名 或者 ios的bundileID*/
   4: string packAge;
}

struct QrcodeValidateParam{
    /* 登录用户的id */
    1: i64 userID;
     /* 公众号的id */
    2: i64 id;
     /* 二维码uuid */
    3: string qrcode;
     /* 豆豆登陆账号类型 */
    4: byte accountType;
}
/**
 * resultCode:
 * 100008000 ->服务异常
 * 100008001 ->公众号不合法
 * 100008003 ->二维码失效
 * 0         ->成功
 **/
struct QrcodeValidateResult{
    /* 返回状态码 */
    1: i32 resultCode;
    /* 公众号名称 */
    2: string appName;
    /* 公众号图标 */
    3: string appIcon;
    /* 授权范围、列表（目前默认：1） */
    4: i32 scope;
}

/**
 * SDK白名用户结构体
 */
struct SdkWhiteUser{
	/* SDKID */
	1:i64 SDKID;
	/* 用户id */
	2:i64 userID;
	/* commonID */
	3:string commonID;
}

/**
 * 二维码扫描结果集
 * 100011002 扫码成功
 * 100011003 登录成功
 * 100011004 超时
 * 100011005 未知错误
 * 100011006 缺少参数
 * 100011007 用户ID不一致
 * 100011008 二维码被占用
 */
struct QrCodeResultBean{
	/* 返回状态码 */
	1:i64 code;
	/* 返回状态说明 */
	2:string msg;
}

struct SignalProtocolAddress {
	/*用户ID*/
	1:i64 userId;
	/*设备类型 目前为pc和移动端*/
	2:i32 deviceType
}

/**
 * 身份公钥
 */
struct IdentityKey {
  	1: SignalProtocolAddress devAddress;
  	//identityPreKey 公钥
 	2: string identityPubPreKey;
 	//identityPreKey 公钥长度  
	3: i32 identityPubPreKeyLen;
	//标记唯一的identityKey服务器生成   
	4: i64 identityKeyID;
	//端到端会话开关
	5: string identityPubPreKeySwitch;
}

/**
 * 获取身份公钥结果集
 */
struct IdentityKeyResult {
  	1: list<IdentityKey> identityKey;
	//端到端服务器总开关开关
	2: string serverPubPreKeySwitch;
}

/**
* 端到端开关
**/
struct EndToEndSwitch {
//发起方userId
    1: i64 userId;
//    目标id
    2: i64  targetId;
//    设备类型
    3: i32  deviceType;
//    开关值
    4: i32  switchVal;
}

/**
 * 预签名公钥
 */
struct SignedPreKey {
  	1: SignalProtocolAddress devAddress;
  	//signedPreKey 公钥
	2: string signedpreKey;
	//signedPreKey 公钥长度      
	3: i32 signedpreKeyLen;
	//签名      
	4: string signature;
	//签名长度        
	5: i32 signatureLen;
	//标记唯一的signedPreKey 服务器生成        
	6: i64 signedpreKeyID;
	//signedpreKeyID的时间戳服务器生成  
	7: i64 signedpreKeyTimestamp;  
}

/**
 * 一次性秘钥
 */
struct PreKey {
   	1: SignalProtocolAddress devAddress;
   	//preKey 公钥
   	2: string pubPreKey;
   	//preKey 公钥长度
	3: i32 pubPreKeyLen;
	//标记唯一的preKey
   	4: i64 preKeyIDS;
}

/**
 * 秘钥（包含身份秘钥、预签名秘钥、一次性秘钥）
 */
struct SignalProtocolKeys {
	//用户生成的身份公钥
	1: IdentityKey idKey;  
	//用户生成的预签名公钥
	2: SignedPreKey signedKey;
	//用户生成的一组一次性公钥
	3: list<PreKey> preKeyList;    
}

/**
 * 一套秘钥
 */
struct SignalBundle{
   	1: SignalProtocolAddress devAddress;
	2: IdentityKey idkey;
	3: SignedPreKey signedKey;
	4: optional PreKey preKey;
}
/**
 *群公告信息
 */
struct GroupAnnouncement{
    /****/
    1: i64 announcementID;
    /****/
    2: i64 groupID;
    /****/
    3: i64 createUserID;
    /****/
    4: i64 createDt;
    /****/
    5: string content;
}
/**
 *群公告分页查询
 */
struct GroupAnnouncementParam{
    /**已拉取到的最终群公告id**/
    1: i64 lastSourceID;
    /**群id**/
    2: i64 groupID;
    /**用户id**/
    3: i64 userID;
    /**每页大小 默认20**/
    4: i32 pageSize;
}


/*客服信息*/
struct AppCustomerServiceInfo{
    /**客服id**/
    1: i64 CSID;
    /**公众号id**/
    2: i64 appID;
    /**客服的用户id**/
    3: i64 customerID;
    /**在线状态1:在线，2:离线**/
    4: byte onlineStatus;
    /**当前最大可接待数**/
    5: i32 maxReception;
    /**总接待数**/
    6: i32 totalReception;
    /**客服头像**/
    7: string portraitUrl;
    /**客服昵称**/
    8: string nickname;
    /**扩展信息**/
    9: string extJson;
    /**创建时间**/
    10: i64 createDt;
    /**修改时间**/
    11: i64 updateDt;
}


/*客户池中客户信息*/
struct CustomerPoolBean{
    /**客户id**/
    1: i64 userID;
    /**客户昵称**/
    2: string name;
    /**客户头像**/
    3: string portraitURL;
    /**最后一条消息**/
    4: MessageBean message;
}

struct ApplicationForm{
	/*追踪单号*/
	1:optional i64 applicationID;
	/*消息类型*/
	2:i32 subMessagetype;
	/*请求者id*/
	3:i64 requestID;
	/*被请求者id，是群的时候填写群id,邀请入群的时候填的是被邀请人*/
	4:i64 targetID;
	/*被请求者类型：1人 2群*/
	5:i32 targetType;
	/*过期时间:秒*/
	6:optional i64 expiretime;
	/*实际响应人*/
	7:optional string handlePerson;
	/*响应结果：1申请 2同意 3拒绝*/
	8:i32 status;
	/*群ID*/
	9:optional i64 groupID;
	/*表字段 : extend*/
	10:optional string extend;
}
struct UserGroupSettingsExtend {
   1: optional string sound; /*群提示音 并且此类下面所有的属性都必须是string*/  
}

/**
 *会话详情
 */
struct SessionInfo{
	1:i64 userID;
	2:i64 targetID;
	3:i64 SDKID;
	4:byte setTop;//置顶（1置顶 2取消置顶）
	5:byte setNotDisturb;//免扰（1免扰 2取消免扰）
	6:byte setDelete;//删除（1删除）
}

/**
 * 登录记录
 */
struct LoginRecord{
	/* 用户ID */
	1: i64 userID;
	/* 登录时间 */
	2: i64 loginTime;
	/* 设备类型 */
	3: byte deviceType;
	/* 设备信息 */
	4: string deviceInfo;
	/* mac地址 */
	5: string macCode;
	/* 登录IP */
	6: string loginIP;
	/* 登录地址 */
	7: string loginCity;
	8: i64 SDKID;
}

/**
 * 消息提醒实体
 */
struct ReminderMsg{
	/* 消息提醒ID */
	1: i64 id;
	/* 接收者用户ID */
	2: i64 receiverUserId;
	/* 消息提醒发送时间（时间戳）*/
	3: i64 reminderSendTime;
	/* 需要提醒的消息ID */
	4: i64 reminderMsgId;
	/* 原消息发送者ID（用户或群）*/
	5: i64 sourceId;
	/* 原始消息数据 */
	6: MessageStorageBean sourceMessage;
}

/**
 * 消息提醒实体
 */
struct ReminderMsgPage{
	/* 消息提醒ID */
	1: list<ReminderMsg> reminderMsgList;
	/* 总记录数 */
	2: i64 totalCount;
	/* 总页数*/
	3: i64 totalPageNo;
}

/**
 * 应用帮助
 */
struct SmallAppHelp{
	/* 帮助id */
	1: i64 id;
	/* 公共号（应用号）id */
	2: i64 appId;
	/* 帮助父id */
	3: i64 parentId;
	/* 标题 */
	4: string title;
	/* 帮助类别（1：分类，2：文章） */
	5: byte helpType;
	/* 1:外链；2:文件；3:自定义图文 */
	6: byte articleType;
	/* 外链地址 */
	7: string linkUrl;
	/* 文件地址（客户端原生预览）*/
	8: string fileUrl;
	/* 文章地址（vrvxin web预览）/vrvxin/help/toDetails.do?id={id} */
	9: string detailUrl;
	/* 排序值 */
	10: i32 sortNum;
}



/**
 * 应用帮助查询结构体
 */
struct SmallAppHelpParam{
    /* 帮助父id */
    1: i64 parentId;
    /* 公共号（应用号）id */
    2: i64 appId;
}

/**
 *  PC扫码返回结果
 */
 struct PCLoginQrCodeResult {
    /*结果码
    * 100008009 elogo不能为空
    * 100008010 loginData不能为空
    * 100008011 elogo不正确
    * 100008012 qrCodeId不能为空
    * 100008013 二维码已过期
    * 100008014 二维码已被其他人使用
    * 100008015 userId不能为空
    * 100008016
    * 100008017 confirmLogin不正确
    * 100008018 用户不存在
    * 100008019 失败
    * 100008020 成功
    * 100008021 qrcodeIdEv不能为空
    * 100008022  qrcodeIdEv不正确
    */
 	1:optional i32 resultCode;
 	/*结果信息*/
 	2:optional string resultMsg;
 	/*二维码数据（JSON）*/
 	3:optional string qrCodeData;
 }

 /**
  * 登录设备信息及豆豆版本实体
  */
  struct LoginClientRecord {
    /*用户ID*/
  	1:i64 userID;
  	/*登录时间*/
  	2:i64 loginTime;
  	/*登录设备类型*/
  	3:byte deviceType;
  	/*客户端类型*/
  	4:optional byte clientType;
  	/*登陆设备信息*/
  	5:optional string deviceInfo;
  	/*客户端版本*/
  	6:string clientVersion;
  	/*SDKID*/
  	7:string SDKID;
  }

/**
 * 待办事项
 */
struct AgencyBean{
    /**公共号Id**/
	1:i64 appId;
	/**用户Id**/
	2:i64 userId;
	/**公共号名称**/
	3:optional string appName;
	/**待办事项计数**/
	4:optional i32 agencyCount;
	/**中文消息模板**/
	5:optional string agencyContentZh;
    /**英文消息模板**/
	6:optional string agencyContentEn;
	/**待办事项地址**/
	7:optional string agencyUrl;
	/**待办事项拓展字段**/
	8:optional string agencyExtendInfo;
	/**用户对应用的状态**/
	9:optional byte agencyStatus;
	/**更新时间**/
	10:i64 updateAtTime;
}


  /**
    * 登录设备信息及豆豆版本返回结果实体
    */
    struct ResultLoginRecord {
        /*结果码
        * 100008023 查询成功
        * 100008024 查询人数超过500人
        * 100008025 查询异常
        * 100008026 用户ID集合为空
        */
    	1:i32 resultCode;
    	/*结果信息*/
    	2:string resultMsg;
    	/*返回结果集*/
    	3:optional map<i64,list<LoginClientRecord>> resultMap;
    }


    /*
    * 组织机构搜索人员接口返回实体
    * 2020-06-01 zsl
    */
    struct OrgSearchUserInfo{
        /************用户实体***********/
        1:EnterpriseUserBean uBean;
        /**
        * oPower说明
        * 绑定给被搜索到的用户的组织策略权限
        * JSON格式字符串:{"allowChat":true,"contactVisiable":true}
        * allowChat:	是否可聊天,
        * contactVisiable:	是否可查看联系方式....
        */
        2:string oPower;
    }

    /*
    * 组织机构搜索人员与组织接口返回实体
    * 2020-06-01 zsl
    */
    struct VisibleUserAndOrgResult{
        /************ 用户集合 ***********/
        1:optional list<OrgSearchUserInfo> uBeans;
        /************ 组织集合 ***********/
        2:optional list<OrganizationBean> oBeans;
    }

    /*
    * 组织机构搜索人员于组织入参实体
    * 2020-06-01 zsl
    */
    struct VisibleUserAndOrgParam{
        /*** 搜索的名称关键字(通用与用户名/组织名) ***/
        1:optional string name;
        /*** 选择的部门ID集合---该参数暂时未处理,默认搜索范围是全企业组织 ***/
        2:optional list<i64> orgIDs;
    }

/*
* 密信版本文本消息敏感词词库
*/
struct Thesaurus {
    1: i64 id // 词库标识
    2: string name // 词库名称
    3: string description // 词库描述
    4: list<Words> badWordList // 敏感词
    5: byte isEnable // 词库是否启用，1表示启用 2表示2启用 默认为1
}
    /*
    * 客户端自定义菜单实体
    */
    struct ClientMenu {
       /**id**/
       1: optional i32 id;
       /**客户端菜单类型 1.内置不可关闭菜单;2.内置可关闭菜单;3.用户自定义菜单**/
       2:optional byte type;
       /**客户端菜单code 唯一**/
       3:string code;
       /**客户端菜单name JSON格式字符串 {"zh":"zhname","en":"enname"}**/
       4:optional string name;
       /**客户端菜单是否开启 1.是;2.否**/
       5:optional byte isShow;
       /**客户端默认展示页 1.是;2.否**/
       6:optional byte isDefaultPage;
       /**是否是原生内置图标**/
       7:optional byte isOriginIcon;
       /**客户端默认展示图标**/
       8:optional string defaultIcon;
       /**客户端选中展示图标**/
       9:optional string clickIcon;
       /**客户端菜单拓展字段**/
       10:optional string extend;
       /**客户端菜单排序字段**/
       11:optional i32 sortId;
    }

   struct ClientMenuResult {
      /** 结果码
        * 100008027 查询成功
        * 100008028 entLogo与该服务器标识不符，查询失败
        * 100008029 查询异常
        */
      1:i32 resultCode;
      /**
      * 客户端菜单集合
      */
      2:optional list<ClientMenu> clientMenus;
   }

   /**
    *  用户标签策略返回结果
    */
    struct UserTagStrategy {
       /*结果码
       * 100004609 获取用户策略成功
       * 100004610 获取用户策略为空
       * 100004611 获取用户策略失败
       */
    	1:optional i32 code;
    	/*结果信息*/
    	2:optional string message;
    	/*用户策略（JSON）*/
    	3:optional string data;
    }

    /**
     *  用户认证结构体
     */
    struct UserAuthenticationBean {
        /** 用户账号密码 **/
        1: string password;
        /** 认证类型
         * 1:注销用户密码认证
         */
        2: byte type;
    }

    /**
     *  用户认证结构体
     */
    struct AuthenticationResult {
        /** 认证结果码 **/
        1: i32 code;
        /** 结果说明 **/
        2: string message;
        /** 验证成功 返回认证码 有效期5分钟**/
        3: string authenticationCode;
    }

/** 新个人搜索配置开关*/
struct PersonalSearchDataSwitch{
    /** 后台配置的dickey*/
  1:optional string dicKey;
  /** 后台配置搜索名称*/
  2:optional string dicVal;
  /** 客户端key*/
  3:optional string searchKey;
  /**1开2关*/
    4:i32 switchValue;
}