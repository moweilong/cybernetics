// Code generated by gorm.io/gen. DO NOT EDIT.
// Code generated by gorm.io/gen. DO NOT EDIT.
// Code generated by gorm.io/gen. DO NOT EDIT.

package model

import (
	"time"
)

const TableNameMinerM = "api_miner"

// MinerM 矿机表
type MinerM struct {
	ID          int64     `gorm:"column:id;type:bigint unsigned;primaryKey;autoIncrement:true;comment:主键 ID" json:"id"`                                 // 主键 ID
	Namespace   string    `gorm:"column:namespace;type:varchar(253);not null;uniqueIndex:uniq_namespace_name,priority:1;comment:命名空间" json:"namespace"` // 命名空间
	Name        string    `gorm:"column:name;type:varchar(253);not null;uniqueIndex:uniq_namespace_name,priority:2;comment:矿机名" json:"name"`            // 矿机名
	DisplayName string    `gorm:"column:display_name;type:varchar(253);not null;comment:矿机展示名" json:"display_name"`                                     // 矿机展示名
	Phase       string    `gorm:"column:phase;type:varchar(45);not null;comment:矿机状态" json:"phase"`                                                     // 矿机状态
	MinerType   string    `gorm:"column:miner_type;type:varchar(16);not null;comment:矿机机型" json:"miner_type"`                                           // 矿机机型
	ChainName   string    `gorm:"column:chain_name;type:varchar(253);not null;index:idx_chain_name,priority:1;comment:矿机所属的区块链名" json:"chain_name"`     // 矿机所属的区块链名
	CPU         int32     `gorm:"column:cpu;type:int;not null;comment:矿机 CPU 规格" json:"cpu"`                                                            // 矿机 CPU 规格
	Memory      int32     `gorm:"column:memory;type:int;not null;comment:矿机内存规格" json:"memory"`                                                         // 矿机内存规格
	CreatedAt   time.Time `gorm:"column:created_at;type:datetime;not null;default:CURRENT_TIMESTAMP;comment:创建时间" json:"created_at"`                    // 创建时间
	UpdatedAt   time.Time `gorm:"column:updated_at;type:datetime;not null;default:CURRENT_TIMESTAMP;comment:最后修改时间" json:"updated_at"`                  // 最后修改时间
}

// TableName MinerM's table name
func (*MinerM) TableName() string {
	return TableNameMinerM
}
