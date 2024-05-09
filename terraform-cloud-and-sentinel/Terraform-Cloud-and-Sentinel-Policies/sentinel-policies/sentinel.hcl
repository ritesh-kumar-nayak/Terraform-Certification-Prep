policy "check-terraform-version" {

    source = "./check-terraform-version.sentinel"
    enforcement_level = "hard-mandatory"

}

policy "instance_type_restriction" {
    source = "./instance_type_restriction.sentinel"
    enforcement_level = "soft-mandatory"
}