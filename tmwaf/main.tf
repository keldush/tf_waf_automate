provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config {
    bucket = "tf-tm-state"
    key    = "network/terraform.tfstate"
    region = "${var.region}"
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
  }
}

resource "aws_waf_xss_match_set" "xss_match_set_1" {
  name = "xss_match_set_1"

  xss_match_tuples {
    text_transformation = "HTML_ENTITY_DECODE"

    field_to_match {
      type = "QUERY_STRING"
    }
  }

  xss_match_tuples {
    text_transformation = "URL_DECODE"

    field_to_match {
      type = "URI"
    }
  }

  xss_match_tuples {
    text_transformation = "URL_DECODE"

    field_to_match {
      type = "QUERY_STRING"
    }
  }
}

resource "aws_waf_size_constraint_set" "size_constraint_set_1" {
  name = "tfsize_constraints_1"

  size_constraints {
    text_transformation = "NONE"
    comparison_operator = "GT"
    size                = "8192"

    field_to_match {
      type = "QUERY_STRING"
    }
  }

  size_constraints {
    text_transformation = "NONE"
    comparison_operator = "GT"
    size                = "8192"

    field_to_match {
      type = "URI"
    }
  }
}

resource "aws_waf_sql_injection_match_set" "sql_injection_match_set_1" {
  name = "tf-sql_injection_match_set_1"

  sql_injection_match_tuples {
    text_transformation = "HTML_ENTITY_DECODE"

    field_to_match {
      type = "BODY"
    }
  }

  sql_injection_match_tuples {
    text_transformation = "URL_DECODE"

    field_to_match {
      type = "BODY"
    }
  }

  sql_injection_match_tuples {
    text_transformation = "HTML_ENTITY_DECODE"

    field_to_match {
      type = "QUERY_STRING"
    }
  }

  sql_injection_match_tuples {
    text_transformation = "URL_DECODE"

    field_to_match {
      type = "QUERY_STRING"
    }
  }

  sql_injection_match_tuples {
    text_transformation = "HTML_ENTITY_DECODE"

    field_to_match {
      type = "URI"
    }
  }

  sql_injection_match_tuples {
    text_transformation = "URL_DECODE"

    field_to_match {
      type = "URI"
    }
  }
}

resource "aws_waf_byte_match_set" "byte_set_1" {
  name = "tf_waf_byte_header_match_set_1"

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "voltron"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "baidu"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "wpspider"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "adnormcrawler"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "sogou"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "wordpress"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "etaospider"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "yandex"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }
}

resource "aws_waf_byte_match_set" "byte_set_2" {
  name = "tf_waf_byte_header_match_set_2"

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "curl"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "wget"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "libwww"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "ruby"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "python"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "urllib"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "java"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }
}

resource "aws_waf_byte_match_set" "byte_set_3" {
  name = "tf_waf_byte_uri_match_set_1"

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "/etc/"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "URI"
    }
  }

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = ".ini"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "URI"
    }
  }

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = ".tar.gz"
    positional_constraint = "ENDS_WITH"

    field_to_match {
      type = "URI"
    }
  }

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "shell."
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "URI"
    }
  }

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "/var/"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "URI"
    }
  }

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "/opt/"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "URI"
    }
  }

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "install."
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "URI"
    }
  }

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = ".tar.gz"
    positional_constraint = "ENDS_WITH"

    field_to_match {
      type = "URI"
    }
  }
}

resource "aws_waf_byte_match_set" "byte_set_4" {
  name = "tf_waf_byte_uri_match_set_2"

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = ".log"
    positional_constraint = "ENDS_WITH"

    field_to_match {
      type = "URI"
    }
  }

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "$password"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "URI"
    }
  }

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "$userid"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "URI"
    }
  }

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "$user_name"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "URI"
    }
  }

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "databasedrivermysql"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "URI"
    }
  }

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "user_id"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "URI"
    }
  }

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "username"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "URI"
    }
  }

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "SimplepieFactory"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "URI"
    }
  }
}

resource "aws_waf_rule" "tfsizerule" {
  depends_on  = ["aws_waf_size_constraint_set.size_constraint_set_1"]
  name        = "tfSizeRule"
  metric_name = "tfSizeRule"

  predicates {
    data_id = "${aws_waf_size_constraint_set.size_constraint_set_1.id}"
    negated = false
    type    = "SizeConstraint"
  }
}

resource "aws_waf_rule" "tfxssrule" {
  depends_on  = ["aws_waf_xss_match_set.xss_match_set_1"]
  name        = "tfXSSRule"
  metric_name = "tfXSSRule"

  predicates {
    data_id = "${aws_waf_xss_match_set.xss_match_set_1.id}"
    negated = false
    type    = "XssMatch"
  }
}

resource "aws_waf_rule" "tfsqlirule" {
  depends_on  = ["aws_waf_sql_injection_match_set.sql_injection_match_set_1"]
  name        = "tfSQLIRule"
  metric_name = "tfSQLIRule"

  predicates {
    data_id = "${aws_waf_sql_injection_match_set.sql_injection_match_set_1.id}"
    negated = false
    type    = "SqlInjectionMatch"
  }
}

resource "aws_waf_rule" "tfbytematchsetrule" {
  #depends_on  = ["aws_waf_byte_match_set.byte_set_1, aws_waf_byte_match_set.byte_set_2, aws_waf_byte_match_set.byte_set_3, aws_waf_byte_match_set.byte_set_4"]
  name        = "tfBMSRule"
  metric_name = "tfBMSRule"

  predicates {
    data_id = "${aws_waf_byte_match_set.byte_set_1.id}"
    negated = false
    type    = "ByteMatch"
  }

  predicates {
    data_id = "${aws_waf_byte_match_set.byte_set_2.id}"
    negated = false
    type    = "ByteMatch"
  }

  predicates {
    data_id = "${aws_waf_byte_match_set.byte_set_3.id}"
    negated = false
    type    = "ByteMatch"
  }

  predicates {
    data_id = "${aws_waf_byte_match_set.byte_set_4.id}"
    negated = false
    type    = "ByteMatch"
  }
}

resource "aws_waf_web_acl" "waf_acl" {
  depends_on  = [
    "aws_waf_rule.tfbytematchsetrule", "aws_waf_byte_match_set.byte_set_1", "aws_waf_byte_match_set.byte_set_2",
    "aws_waf_byte_match_set.byte_set_3", "aws_waf_byte_match_set.byte_set_4",
    "aws_waf_rule.tfsqlirule", "aws_waf_sql_injection_match_set.sql_injection_match_set_1",
    "aws_waf_rule.tfxssrule", "aws_waf_xss_match_set.xss_match_set_1",
    "aws_waf_rule.tfsizerule", "aws_waf_size_constraint_set.size_constraint_set_1"
  ]
  name        = "tfWebACL"
  metric_name = "tfWebACL"

  default_action {
    type = "ALLOW"
  }

  rules {
    action {
      type = "BLOCK"
    }

    priority = 1
    rule_id  = "${aws_waf_rule.tfbytematchsetrule.id}"
    type     = "REGULAR"
  }

  rules {
    action {
      type = "BLOCK"
    }

    priority = 2
    rule_id  = "${aws_waf_rule.tfsqlirule.id}"
    type     = "REGULAR"
  }

  rules {
    action {
      type = "BLOCK"
    }

    priority = 3
    rule_id  = "${aws_waf_rule.tfxssrule.id}"
    type     = "REGULAR"
  }

  rules {
    action {
      type = "BLOCK"
    }

    priority = 4
    rule_id  = "${aws_waf_rule.tfsizerule.id}"
    type     = "REGULAR"
  }
}
