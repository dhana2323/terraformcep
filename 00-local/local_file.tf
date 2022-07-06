resource "local_file" "localfile" {
    filename = "/tmp/localfile.txt"
    content = "Test content, Terraform!"
    file_permission     = "0700"
}
