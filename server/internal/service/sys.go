// ================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// You can delete these comments if you wish manually maintain this interface file.
// ================================================================================

package service

import (
	"context"
	"cybernetics/internal/library/cgorm/handler"
	"cybernetics/internal/model"
	"cybernetics/internal/model/entity"
	"cybernetics/internal/model/input/sysin"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/database/gredis"
	"github.com/gogf/gf/v2/encoding/gjson"
	"github.com/gogf/gf/v2/net/ghttp"
)

type (
	ISysBlacklist interface {
		// Delete 删除
		Delete(ctx context.Context, in *sysin.BlacklistDeleteInp) (err error)
		// Edit 修改/新增
		Edit(ctx context.Context, in *sysin.BlacklistEditInp) (err error)
		// Status 更新状态
		Status(ctx context.Context, in *sysin.BlacklistStatusInp) (err error)
		// View 获取指定信息
		View(ctx context.Context, in *sysin.BlacklistViewInp) (res *sysin.BlacklistViewModel, err error)
		// List 获取列表
		List(ctx context.Context, in *sysin.BlacklistListInp) (list []*sysin.BlacklistListModel, totalCount int, err error)
		// VariableLoad 变化加载
		VariableLoad(ctx context.Context, err error)
		// Load 加载黑名单
		Load(ctx context.Context)
		// VerifyRequest 验证请求的访问IP是否在黑名单，如果存在则返回错误
		VerifyRequest(r *ghttp.Request) (err error)
		// ClusterSync 集群同步
		ClusterSync(ctx context.Context, message *gredis.Message)
	}
	ISysConfig interface {
		// InitConfig 初始化系统配置
		InitConfig(ctx context.Context)
		// LoadConfig 加载系统配置
		LoadConfig(ctx context.Context) (err error)
		// GetLogin 获取登录配置
		GetLogin(ctx context.Context) (conf *model.LoginConfig, err error)
		// GetSms 获取短信配置
		GetSms(ctx context.Context) (conf *model.SmsConfig, err error)
		// GetGeo 获取地理配置
		GetGeo(ctx context.Context) (conf *model.GeoConfig, err error)
		// GetUpload 获取上传配置
		GetUpload(ctx context.Context) (conf *model.UploadConfig, err error)
		// GetSmtp 获取邮件配置
		GetSmtp(ctx context.Context) (conf *model.EmailConfig, err error)
		// GetBasic 获取基础配置
		GetBasic(ctx context.Context) (conf *model.BasicConfig, err error)
		// GetLoadTCP 获取本地tcp配置
		GetLoadTCP(ctx context.Context) (conf *model.TCPConfig, err error)
		// GetLoadGenerate 获取本地生成配置
		GetLoadGenerate(ctx context.Context) (conf *model.GenerateConfig, err error)
		// GetLoadToken 获取本地token配置
		GetLoadToken(ctx context.Context) (conf *model.TokenConfig, err error)
		// GetLoadLog 获取本地日志配置
		GetLoadLog(ctx context.Context) (conf *model.LogConfig, err error)
		// GetLoadServeLog 获取本地服务日志配置
		GetLoadServeLog(ctx context.Context) (conf *model.ServeLogConfig, err error)
		// GetConfigByGroup 获取指定分组的配置
		GetConfigByGroup(ctx context.Context, in *sysin.GetConfigInp) (res *sysin.GetConfigModel, err error)
		// ConversionType 转换类型
		ConversionType(ctx context.Context, models *entity.SysConfig) (value interface{}, err error)
		// UpdateConfigByGroup 更新指定分组的配置
		UpdateConfigByGroup(ctx context.Context, in *sysin.UpdateConfigInp) (err error)
		// ClusterSync 集群同步
		ClusterSync(ctx context.Context, message *gredis.Message)
	}
	ISysEmsLog interface {
		// Delete 删除
		Delete(ctx context.Context, in *sysin.EmsLogDeleteInp) (err error)
		// Edit 修改/新增
		Edit(ctx context.Context, in *sysin.EmsLogEditInp) (err error)
		// Status 更新部门状态
		Status(ctx context.Context, in *sysin.EmsLogStatusInp) (err error)
		// View 获取指定字典类型信息
		View(ctx context.Context, in *sysin.EmsLogViewInp) (res *sysin.EmsLogViewModel, err error)
		// List 获取列表
		List(ctx context.Context, in *sysin.EmsLogListInp) (list []*sysin.EmsLogListModel, totalCount int, err error)
		// Send 发送邮件
		Send(ctx context.Context, in *sysin.SendEmsInp) (err error)
		// GetTemplate 获取指定邮件模板
		GetTemplate(ctx context.Context, template string, config *model.EmailConfig) (val string, err error)
		// AllowSend 是否允许发送
		AllowSend(ctx context.Context, models *entity.SysEmsLog, config *model.EmailConfig) (err error)
		// NowDayIpSendCount 当天IP累计发送次数
		NowDayIpSendCount(ctx context.Context, event string) (count int, err error)
		// VerifyCode 效验验证码
		VerifyCode(ctx context.Context, in *sysin.VerifyEmsCodeInp) (err error)
	}
	ISysLog interface {
		// Model 请求日志Orm模型
		Model(ctx context.Context, option ...*handler.Option) *gdb.Model
		// Export 导出
		Export(ctx context.Context, in *sysin.LogListInp) (err error)
		// RealWrite 真实写入
		RealWrite(ctx context.Context, log entity.SysLog) (err error)
		// AutoLog 根据配置自动记录请求日志
		AutoLog(ctx context.Context) error
		// AnalysisLog 解析日志数据
		AnalysisLog(ctx context.Context) entity.SysLog
		// SimplifyHeaderParams 过滤掉请求头中的大参数
		SimplifyHeaderParams(data *gjson.Json) *gjson.Json
		// View 获取指定请求日志信息
		View(ctx context.Context, in *sysin.LogViewInp) (res *sysin.LogViewModel, err error)
		// Delete 删除请求日志
		Delete(ctx context.Context, in *sysin.LogDeleteInp) (err error)
		// List 请求日志列表
		List(ctx context.Context, in *sysin.LogListInp) (list []*sysin.LogListModel, totalCount int, err error)
	}
	ISysLoginLog interface {
		// Model 登录日志Orm模型
		Model(ctx context.Context, option ...*handler.Option) *gdb.Model
		// List 获取登录日志列表
		List(ctx context.Context, in *sysin.LoginLogListInp) (list []*sysin.LoginLogListModel, totalCount int, err error)
		// Export 导出登录日志
		Export(ctx context.Context, in *sysin.LoginLogListInp) (err error)
		// Delete 删除登录日志
		Delete(ctx context.Context, in *sysin.LoginLogDeleteInp) (err error)
		// Push 推送登录日志
		Push(ctx context.Context, in *sysin.LoginLogPushInp)
		// RealWrite 真实写入
		RealWrite(ctx context.Context, models entity.SysLoginLog) (err error)
	}
	ISysServeLog interface {
		// Model 服务日志Orm模型
		Model(ctx context.Context) *gdb.Model
		// List 获取服务日志列表
		List(ctx context.Context, in *sysin.ServeLogListInp) (list []*sysin.ServeLogListModel, totalCount int, err error)
		// Export 导出服务日志
		Export(ctx context.Context, in *sysin.ServeLogListInp) (err error)
		// Delete 删除服务日志
		Delete(ctx context.Context, in *sysin.ServeLogDeleteInp) (err error)
		// View 获取服务日志指定信息
		View(ctx context.Context, in *sysin.ServeLogViewInp) (res *sysin.ServeLogViewModel, err error)
		// RealWrite 真实写入
		RealWrite(ctx context.Context, models entity.SysServeLog) (err error)
	}
	ISysSmsLog interface {
		// Delete 删除
		Delete(ctx context.Context, in *sysin.SmsLogDeleteInp) (err error)
		// View 获取指定字典类型信息
		View(ctx context.Context, in *sysin.SmsLogViewInp) (res *sysin.SmsLogViewModel, err error)
		// List 获取列表
		List(ctx context.Context, in *sysin.SmsLogListInp) (list []*sysin.SmsLogListModel, totalCount int, err error)
		// SendCode 发送验证码
		SendCode(ctx context.Context, in *sysin.SendCodeInp) (err error)
		// GetTemplate 获取指定短信模板
		GetTemplate(ctx context.Context, template string, config *model.SmsConfig) (val string, err error)
		// AllowSend 是否允许发送
		AllowSend(ctx context.Context, models *entity.SysSmsLog, config *model.SmsConfig) (err error)
		// NowDayIpSendCount 当天IP累计发送次数
		NowDayIpSendCount(ctx context.Context, event string) (count int, err error)
		// VerifyCode 效验验证码
		VerifyCode(ctx context.Context, in *sysin.VerifyCodeInp) (err error)
	}
)

var (
	localSysBlacklist ISysBlacklist
	localSysConfig    ISysConfig
	localSysEmsLog    ISysEmsLog
	localSysLog       ISysLog
	localSysLoginLog  ISysLoginLog
	localSysServeLog  ISysServeLog
	localSysSmsLog    ISysSmsLog
)

func SysBlacklist() ISysBlacklist {
	if localSysBlacklist == nil {
		panic("implement not found for interface ISysBlacklist, forgot register?")
	}
	return localSysBlacklist
}

func RegisterSysBlacklist(i ISysBlacklist) {
	localSysBlacklist = i
}

func SysConfig() ISysConfig {
	if localSysConfig == nil {
		panic("implement not found for interface ISysConfig, forgot register?")
	}
	return localSysConfig
}

func RegisterSysConfig(i ISysConfig) {
	localSysConfig = i
}

func SysEmsLog() ISysEmsLog {
	if localSysEmsLog == nil {
		panic("implement not found for interface ISysEmsLog, forgot register?")
	}
	return localSysEmsLog
}

func RegisterSysEmsLog(i ISysEmsLog) {
	localSysEmsLog = i
}

func SysLog() ISysLog {
	if localSysLog == nil {
		panic("implement not found for interface ISysLog, forgot register?")
	}
	return localSysLog
}

func RegisterSysLog(i ISysLog) {
	localSysLog = i
}

func SysLoginLog() ISysLoginLog {
	if localSysLoginLog == nil {
		panic("implement not found for interface ISysLoginLog, forgot register?")
	}
	return localSysLoginLog
}

func RegisterSysLoginLog(i ISysLoginLog) {
	localSysLoginLog = i
}

func SysServeLog() ISysServeLog {
	if localSysServeLog == nil {
		panic("implement not found for interface ISysServeLog, forgot register?")
	}
	return localSysServeLog
}

func RegisterSysServeLog(i ISysServeLog) {
	localSysServeLog = i
}

func SysSmsLog() ISysSmsLog {
	if localSysSmsLog == nil {
		panic("implement not found for interface ISysSmsLog, forgot register?")
	}
	return localSysSmsLog
}

func RegisterSysSmsLog(i ISysSmsLog) {
	localSysSmsLog = i
}
