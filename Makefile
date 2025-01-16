install:
	brew install mint	

bootstrap:
	mint bootstrap

project:
	mint run xcodegen -s project.yml

lint:
	mint run swiftlint --config .swiftlint.yml

lint_fix:
	mint run swiftlint --fix --config .swiftlint.yml
