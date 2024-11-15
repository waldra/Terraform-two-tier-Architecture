variable "db_subnet_name" {
  description = "The subnet name for the DB"
  type        = string
  default     = "two-tier db subnet group"
}

variable "subnet_ids" {
  description = "List of subnets IDs where the DB is created"
  type        = list(string)
}

variable "engine" {
  description = "The database engine to use, e.g., mysql, postgres"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "Version of database engine"
  type        = string
  default     = "8.0"
}

variable "instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
  default     = 5
}

variable "storage_type" {
  description = "The storage type: gp2, io1, or standard"
  type        = string
  default     = "gp2"
}

variable "multi_az" {
  description = "Multi az for database"
  type        = bool
  default     = false
}

variable "db_name" {
  description = "The name of DB"
  type        = string
  default     = "mysql_db"
}

variable "username" {
  description = "The username for the master DB user"
  type        = string
}

variable "password" {
  description = "The password for the master DB user"
  type        = string
  sensitive   = true
}

variable "parameter_group_name" {
  description = "The name of the DB parameter group to use"
  type        = string
  default     = "default.mysql8.0"
}

variable "allow_major_version_upgrade" {
  description = "Whether to allow major version upgrade"
  type        = bool
  default     = false
}

variable "auto_minor_version_upgrade" {
  description = "Whether to allow automatic minor version upgrade"
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  description = "Number of days to retain the DB backup"
  type        = number
  default     = 35
}

variable "skip_final_snapshot" {
  description = "Whether to skip final snapshot"
  type        = bool
  default     = true
}

variable "publicly_accessible" {
  description = ""
  type        = bool
  default     = false
}

variable "db_sg_id" {
  description = "The security group of DB"
  type        = string
}