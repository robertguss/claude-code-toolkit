# Template placeholders

These placeholders are replaced by `scripts/render_template.py` during scaffolding.

- __APP_NAME__
  - App and scheme name.
- __BUNDLE_ID__
  - Full bundle identifier (e.g., com.example.MyApp).
- __DEPLOYMENT_TARGET__
  - Deployment target (iOS 18.0 or macOS 15.4 by default).
- __PLATFORM__
  - ios or macos.
- __SIM_NAME__
  - iOS Simulator name (defaults to "auto" to pick the newest available iPhone).
- __SCRIPTS_DIR__
  - Toolkit scripts directory (defaults to `./scripts` or `./scripts/<namespace>`).
- __TARGET_PREFIX__
  - Optional Makefile target prefix when the toolkit is namespaced (e.g., `demo-`).
- __APP_GENERATOR__
  - Generator used for project generation: `xcodegen`.
