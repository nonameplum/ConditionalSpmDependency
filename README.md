# Conditional SPM dependency

An example project presenting how Swift Package Manager (SPM) dependency can be integrated conditionally in a project.

Environment variable is used in the `Package.swift` file to determine if a dependency should be included.
Xcode needs to be opened with the environment variable set before opening the project. Only then the `Package.swift` will be receive the environment variable.

## Note

If Xcode was previously opened, it is required to close (kill) any running Xcode instance before opening with environment variable.

## How to?

`Makefile` contains two helpers to open the project with or without environment variable to conditionally include or not SPM dependency.

Run respectively to desired outcome:
```
make open_with_mock
make open_without_mock
```