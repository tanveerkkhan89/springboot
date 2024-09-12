variable  "region" {
  default = "us-east-2"
  type = string
}

variable "cidr_block" {
  default = "10.0.0.0/16"
  type = string
}


variable "eks_cluster" {
    default = "example-eks-cluster"
    type = string
}

variable "node_group_name" {
    default = "example-node-group"
    type = string
}


variable "eks_node_sgname" {
    default = "eks-nodes-sg"
    type = string
    }


variable "alb_sg" {
    default = "alb_sg"
      type = string
}

variable "eks-cluster-role" {
    default = "eks-cluster-role"
      type = string
}

variable "eks-node-role-unique" {
    default = "eks-node-role-unique"
      type = string
}


variable "ALBIngressIAMRole" {
default = "ALBIngressIAMRole"
  type = string
}


variable "ALBIngressPolicy"{
default = "ALBIngressPolicy"
  type = string
}