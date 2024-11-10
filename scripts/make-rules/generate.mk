# ==============================================================================
# Makefile helper functions for generate necessary files
#

.PHONY: gen.protoc
gen.protoc: ## Generate go source files from protobuf files.
	@protoc \
		--proto_path=$(APIROOT) \
		--proto_path=$(APISROOT) \
		--proto_path=$(CYBERNETICS_ROOT)/third_party/protobuf \
		--go_out=paths=source_relative:$(APIROOT) \
		--go-http_out=paths=source_relative:$(APIROOT) \
		--go-grpc_out=paths=source_relative:$(APIROOT) \
		--go-errors_out=paths=source_relative:$(APIROOT) \
		--go-errors-code_out=paths=source_relative:$(CYBERNETICS_ROOT)/docs/guide/zh-CN/api/errors-code \
		--validate_out=paths=source_relative,lang=go:$(APIROOT) \
		--openapi_out=fq_schema_naming=true,default_response=false:$(CYBERNETICS_ROOT)/api/openapi \
		--openapiv2_out=$(CYBERNETICS_ROOT)/api/openapi \
		--openapiv2_opt=logtostderr=true \
		--openapiv2_opt=json_names_for_fields=false \
		$(shell find $(APIROOT) -name *.proto)
	# Only onex-fake-server use grpc-gateway
	@protoc \
		--proto_path=$(APIROOT) \
		--proto_path=$(APISROOT) \
		--proto_path=$(CYBERNETICS_ROOT)/third_party/protobuf \
		--grpc-gateway_out=paths=source_relative:$(APIROOT) \
		$(shell find $(APIROOT)/fakeserver -name *.proto)