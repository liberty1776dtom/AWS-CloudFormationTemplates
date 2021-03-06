provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "${var.region}"
}

module "fgcp-ha" {
  source = "modules/ftnt_aws/fgt/2instances_fgcp_ha_pair_byol"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "${var.region}"

  availability_zone = "${var.availability_zone}"
  vpc_id = "${var.vpc_id}"
  vpc_cidr = "${var.vpc_cidr}"
  public_subnet_id = "${var.public_subnet_id}"
  private_subnet_id = "${var.private_subnet_id}"
  hasync_subnet_id = "${var.hasync_subnet_id}"
  hamgmt_subnet_id = "${var.hamgmt_subnet_id}"

  ami = "${var.license_type == "byol" ? lookup(var.fgt-byol-amis, var.region) : lookup(var.fgt-ond-amis, var.region)}"
  keypair = "${var.keypair}"  
  cidr_for_access = "${var.cidr_for_access}"
  instance_type = "${var.instance_type}"
  license_type = "${var.license_type}"
  fgt1_byol_license = "${var.fgt1_byol_license}"
  fgt2_byol_license = "${var.fgt2_byol_license}"
  public_subnet_intrinsic_router_ip = "${var.public_subnet_intrinsic_router_ip}"
  private_subnet_intrinsic_router_ip = "${var.private_subnet_intrinsic_router_ip}"
  hamgmt_subnet_intrinsic_router_ip = "${var.hamgmt_subnet_intrinsic_router_ip}"
  tag_name_prefix = "${var.tag_name_prefix}"

  fgt1_public_ip = "${var.fgt1_public_ip}"
  fgt1_private_ip = "${var.fgt1_private_ip}"
  fgt1_hasync_ip = "${var.fgt1_hasync_ip}"
  fgt1_hamgmt_ip = "${var.fgt1_hamgmt_ip}"

  fgt2_public_ip = "${var.fgt2_public_ip}"
  fgt2_private_ip = "${var.fgt2_private_ip}"
  fgt2_hasync_ip = "${var.fgt2_hasync_ip}"
  fgt2_hamgmt_ip = "${var.fgt2_hamgmt_ip}"
  
  cluster_public_ip = "${var.cluster_public_ip}"
  cluster_private_ip = "${var.cluster_private_ip}"
}