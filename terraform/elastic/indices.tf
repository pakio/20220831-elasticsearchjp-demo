resource "elasticstack_elasticsearch_index" "valid_index" {
  name = "valid-index"

  mappings = <<EOF
  {
    "properties": {
      "name": {
        "type": "text",
        "analyzer": "text_en"
      }
    }
  }
  EOF

  settings {
    setting {
      name  = "index.analysis.analyzer.text_en.type"
      value = "custom"
    }
    setting {
      name  = "index.analysis.analyzer.text_en.tokenizer"
      value = "whitespace"
    }
    setting {
      name  = "index.analysis.analyzer.text_en.filter"
      value = "asciifolding,lowercase,stop,stemmer"
    }
  }
}

resource "elasticstack_elasticsearch_index" "invalid_index" {
  name = "invalid-index"

  mappings = <<EOF
  {
    "properties": {
      "name": {
        "type": "text",
        "analyzer": "text_en"
      }
    }
  }
  EOF

  settings {
    setting {
      name  = "index.analysis.analyzer.text_en.type"
      value = "custom"
    }
    setting {
      name  = "index.analysis.analyzer.text_en.tokenizer"
      value = "whitespace"
    }
    setting {
      name  = "index.analysis.analyzer.text_en.filter"
      value = "custom_synonym,asciifolding,lowercase,stop,stemmer"
    }

    # Synonyms settings
    setting {
      name = "index.analysis.filter.custom_synonym.type"
      value = "synonym"
    }

    setting {
      name = "index.analysis.filter.custom_synonym.synonyms"
      value = "LOTR => The Lord of the Rings"
    }
  }
}
