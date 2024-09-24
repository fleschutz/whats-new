﻿<#
.SYNOPSIS
        Update The Daily GitHub
.DESCRIPTION
        This PowerShell script writes The Daily GitHub to the standard output. It requires GitHub CLI.
.EXAMPLE
        PS> ./bot.ps1 > README.md
.LINK
        https://github.com/fleschutz/whats-new
.NOTES
        Author: Markus Fleschutz | License: CC0
#>

function Repo([string]$name, [string]$URLpart, [string]$versionPrefix) {
	$releases = (gh api /repos/$URLpart/releases?per_page=1 --method GET) | ConvertFrom-Json
	foreach($release in $releases) {
		$version = $release.tag_name
		if ($version -like $versionPrefix) {
			$version = $version.Substring($versionPrefix.Length - 1)
		}
		if ("$($release.published_at)" -like "2024-09-23T*") { $version += "🆕" }
		return "[$name](https://github.com/$URLpart) $version, "
	}

	$tags = (gh api /repos/$URLpart/tags?per_page=1 --method GET) | ConvertFrom-Json
	foreach($tag in $tags) {
		$version = $tag.name
		if ($version -like $versionPrefix) {
			$version = $version.Substring($versionPrefix.Length - 1)
		}
		if ("$($tag.published_at)" -like "2024-09-23T*") { $version += "🆕" }
		return "[$name](https://github.com/$URLpart) $version, "
	}
	return "[$name](https://github.com/$URLpart), "
}

try {
	"The Daily GitHub - Latest Repo Releases"
	"======================================="
	""
	"**Welcome to a new overview of selected GitHub repositories:** *(generated by bot.ps1)*"
	""
	$ln = Repo "curl"                "curl/curl"          "curl-*"
	$ln += Repo "Git"                "git/git"            "v*"
	$ln += Repo "Hugo"               "gohugoio/hugo"      "v*"
	$ln += Repo "Linux"              "torvalds/linux"     "v*"
	$ln += Repo "Mastodon"           "mastodon/mastodon"  "v*"
	$ln += Repo "OpenMCT"            "nasa/openmct"       "v*"
	$ln += Repo "Redis"              "redis/redis"        ""
	$ln += Repo "Smartmontools"      "smartmontools/smartmontools" "RELEASE_*"
	$ln += Repo "ZFS"                "openzfs/zfs"        "zfs-*"
	"**Today Sept. 24,** the latest releases in the **Featured** section are: $ln"
	""
	$ln = Repo "Atom"                "atom/atom"          "v*"
	$ln += Repo "GNU Emacs"          "emacs-mirror/emacs" ""
	$ln += Repo "NetBeans"           "apache/netbeans"    ""
	$ln += Repo "NeoVim"             "neovim/neovim"      ""
	$ln += Repo "TextMate"           "textmate/textmate"  "v*"
	$ln += Repo "Nano"               "madnight/nano"      ""
	$ln += Repo "Notepad++"          "notepad-plus-plus/notepad-plus-plus" "v*"
	$ln += Repo "Vim"                "vim/vim"            ""
	$ln += Repo "Visual Studio Code" "microsoft/vscode"   ""
	$ln += Repo "Zed"                "zed-industries/zed" "v*"
	"In **Text Editors / IDE's** the latest releases are: $ln"
	""
	$ln = Repo "Blender"             "blender/blender"       ""
	$ln += Repo "Chromium"           "chromium/chromium"     ""
	$ln += Repo "GIMP"               "GNOME/gimp"            ""
	$ln += Repo "Meld"               "GNOME/meld"            ""
	$ln += Repo "OBS Studio"         "obsproject/obs-studio" ""
	$ln += Repo "PowerToys"          "microsoft/PowerToys"   "v*"
	$ln += Repo "Windows Terminal"   "microsoft/terminal"    "v*"
	$ln += Repo "Zen Browser"        "zen-browser/desktop"   ""
	"In **General Apps** the latest are: $ln"
	""
	$ln = Repo "AssemblyScript"      "AssemblyScript/assemblyscript" "v*"
	$ln += Repo "C#"                 "dotnet/csharplang"             ""
	$ln += Repo "Clojure"            "clojure/clojure"               ""
	$ln += Repo "CoffeeScript"       "jashkenas/coffeescript"        ""
	$ln += Repo "Crystal"            "crystal-lang/crystal"          ""
	$ln += Repo "Go"                 "golang/go"                     ""
	$ln += Repo "Elixir"             "elixir-lang/elixir"            ""
	$ln += Repo "Elm"                "elm/compiler"                  ""
	$ln += Repo "Erlang"             "erlang/otp"                    ""
	$ln += Repo "Groovy"             "apache/groovy"                 ""
	$ln += Repo "Julia"              "JuliaLang/julia"               "v*"
	$ln += Repo "Kotlin"             "JetBrains/kotlin"              "v*"
	$ln += Repo "MicroPython"        "micropython/micropython"       "v*"
	$ln += Repo "Mojo"               "modularml/mojo"                ""
	$ln += Repo "Nim"                "nim-lang/Nim" ""
	$ln += Repo "Odin"               "odin-lang/Odin" ""
	$ln += Repo "Orca"               "hundredrabbits/Orca" ""
	$ln += Repo "PHP"                "php/php-src" ""
	$ln += Repo "PowerShell"         "PowerShell/PowerShell" "v*"
	$ln += Repo "Python"             "python/cpython" ""
	$ln += Repo "Roslyn"             "dotnet/roslyn" "v*"
	$ln += Repo "Ruby"               "ruby/ruby" "v*"
	$ln += Repo "Ruby on Rails"      "rails/rails" ""
	$ln += Repo "Rust"               "rust-lang/rust" ""
	$ln += Repo "Scala"              "scala/scala" "v*"
	$ln += Repo "Swift"              "swiftlang/swift" "swift-"
	$ln += Repo "TypeScript"         "microsoft/TypeScript" "v*"
	"In **Programming Languages** we are at: $ln"
	""
	$ln = Repo "alsa-lib"            "alsa-project/alsa-lib" ""
	$ln += Repo "Boost"              "boostorg/boost" "boost-*"
	$ln += Repo "libarchive"         "libarchive/libarchive" "v*"
	$ln += Repo "libexpat"           "libexpat/libexpat" "R_*"
	$ln += Repo "libgit2"            "libgit2/libgit2" "v*"
	$ln += Repo "libyuv"             "lemenkov/libyuv" ""
	$ln += Repo "OpenCV"             "opencv/opencv" ""
	$ln += Repo "SymCrypt"           "microsoft/SymCrypt" "v*"
	"In **Software Libs** the latest releases are: $ln"
	""
	$ln = Repo "Ant"                 "apache/ant" ""
	$ln += Repo "Bazel"              "bazelbuild/bazel" ""
	$ln += Repo "CMake"              "Kitware/CMake" "v*"
	$ln += Repo "Gradle"             "gradle/gradle" "v*"
	$ln += Repo "Homebrew"           "Homebrew/brew" ""
	$ln += Repo "LLVM"               "llvm/llvm-project" "llvmorg-*"
	$ln += Repo "Maven"              "apache/maven" "maven-*"
	$ln += Repo "Meson"              "mesonbuild/meson" ""
	$ln += Repo "Ninja"              "ninja-build/ninja" "v*"
	$ln += Repo "Pants"              "pantsbuild/pants" "release_*"
	$ln += Repo "TinyCC"             "TinyCC/tinycc" ""
	"Looking at **Compiler &amp; Build Systems** we have: $ln"
	""
	$ln = Repo "Ansible"             "ansible/ansible" "v*"
	$ln += Repo "Capistrano"         "capistrano/capistrano" "v*"
	$ln += Repo "Chef"               "chef/chef" "v*"
	$ln += Repo "Grafana"            "grafana/grafana" "v*"
	$ln += Repo "Jenkins"            "jenkinsci/jenkins" "jenkins-*"
	$ln += Repo "Kubernetes"         "kubernetes/kubernetes" "v*"
	$ln += Repo "Moby"               "moby/moby" "v*"
	$ln += Repo "OpenStack"          "openstack/openstack" ""
	$ln += Repo "Prometheus"         "prometheus/prometheus" "v*"
	$ln += Repo "Puppet"             "puppetlabs/puppet"  ""
	$ln += Repo "Salt"               "saltstack/salt" "v*"
	$ln += Repo "statsd"             "statsd/statsd" ""
	$ln += Repo "Terraform"          "hashicorp/terraform" "v*"
	$ln += Repo "Vagrant"            "hashicorp/vagrant" ""
	"And last but not least **DevOps** with: $ln"
	""
	exit 0 # success
} catch {
        "⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
        exit 1
}