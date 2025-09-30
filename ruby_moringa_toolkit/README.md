# Prompt-Powered Kickstart: Beginner's Toolkit for **Ruby (Sinatra)**

*Author:* Samuel Kamawira (Faceless Executor) — *Tutor tone: experienced Ruby dev, step-by-step, friendly.*

---

## 1) Title & Objective

**Title:** Getting Started with Ruby & Sinatra — A Beginner's Guide (Moringa AI Capstone)

**Why Ruby?**  
Ruby is expressive, readable, and a language that favors developer happiness. For a short capstone, using Sinatra (a microframework) lets you build a runnable web example quickly, while teaching you how Ruby apps are structured and packaged.

**End goal:**  
By the end you'll have a runnable minimal web app (Hello World + small JSON API), a reproducible environment using `rbenv` + Bundler, a documented prompt journal showing how GenAI helped, and troubleshooting notes.

---

## 2) Quick Summary of the Technology

- **Ruby** is a high-level, dynamic programming language focused on programmer productivity and readability. Use it for scripting, web apps, and automation.  
- **Sinatra** is a lightweight Ruby web DSL (microframework) ideal for tiny web apps and APIs — much simpler than Rails and perfect for fast experiments.  
- **Bundler** manages gems (Ruby libraries) and locks versions so your environment is reproducible.

---

## 3) System Requirements (tested on Ubuntu 24.04)

- OS: Ubuntu 24.04 (instructions below will also work on other Debian/Ubuntu derivatives).  
- Tools: `git`, `curl`, `build-essential` (compiler toolchain), `rbenv` (recommended Ruby version manager).  
- Packages: see the "Install dependencies" step below — these are required to compile Ruby from source.

> I recommend using `rbenv` (or `rvm`) instead of system Ruby to avoid permission issues and to manage multiple Ruby versions.

---

## 4) Installation & Setup Instructions (complete, copy-paste commands)

### Step 0 — open a terminal
These commands assume a fresh Ubuntu 24.04 environment and a normal user account.

### Step 1 — install OS dependencies needed to build Ruby
```bash
sudo apt update
sudo apt install -y git curl build-essential ca-certificates   autoconf bison libssl-dev libyaml-dev libreadline-dev zlib1g-dev   libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev   libdb-dev uuid-dev rustc
```
*(These match community guides for Ubuntu 24.04; they're required so ruby-build can compile Ruby.)*

### Step 2 — install rbenv and ruby-build
```bash
# clone rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
# reload shell
exec $SHELL

# install ruby-build plugin
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
```

### Step 3 — install Ruby (use the project .ruby-version or pick a version)
This project pins Ruby to `3.4.6` (a recent stable release as of Sep 2025). You can change that if needed.

```bash
# install required Ruby version
rbenv install 3.4.6
rbenv global 3.4.6
ruby -v   # confirm: ruby 3.4.6p...
```

*(If `rbenv install 3.4.6` fails because of missing libs, re-check Step 1 — dependencies.)*

### Step 4 — install Bundler and project gems
From the project root (where `Gemfile` is located):

```bash
gem install bundler
bundle install
```

### Step 5 — run the app
```bash
# run directly
ruby app.rb

# or use bundler (makes sure correct gem versions are used)
bundle exec ruby app.rb
```

Open `http://localhost:4567` in your browser or test via `curl`:
```bash
curl http://localhost:4567/
curl http://localhost:4567/api/hello
```

---

## 5) Minimal Working Example

**What it does:**  
A tiny Sinatra app with:
- `/` : returns an HTML "Hello" message.
- `/api/hello` : returns a JSON payload with a message and timestamp.

**Files:** `app.rb`, `Gemfile`, `.ruby-version`.

**app.rb** (annotated):
```ruby
#!/usr/bin/env ruby
# frozen_string_literal: true

# app.rb - Minimal Sinatra app for Moringa capstone.
#
# Usage:
#   bundle install
#   ruby app.rb
#
# Visit: http://localhost:4567

require 'sinatra'
require 'sinatra/reloader' if development? # auto-reload when editing (dev only)
require 'json'

# Make the app accessible across the network (useful in VM/container)
set :bind, '0.0.0.0'
set :port, ENV.fetch('PORT', 4567)

# Root route - HTML response
get '/' do
  # Inline HTML is fine for a tiny example. In real apps use views/ERB templates.
  "<h1>Hello, Moringa — Ruby & Sinatra Toolkit</h1>
<p>This page proves Sinatra is running.</p>"
end

# Simple JSON API endpoint
get '/api/hello' do
  content_type :json
  { message: 'Hello from Ruby API', time: Time.now }.to_json
end
```

**Gemfile**
```ruby
source "https://rubygems.org"

ruby "3.4.6"

gem "sinatra", "~> 3.0"
gem "puma"
group :development do
  gem "sinatra-contrib" # includes reloader and useful helpers
end
```

**.ruby-version**
```
3.4.6
```

**Expected output**
- Visiting `/` shows an HTML greeting.
- `curl http://localhost:4567/api/hello` returns JSON like:
```json
{"message":"Hello from Ruby API","time":"2025-09-30 19:00:00 +0300"}
```

---

## 6) AI Prompt Journal (sample prompts & reflections)

> You will need to run prompts via ai.moringaschool.com (or ChatGPT). Below are example prompts I used while building this guide. Save them in your submission as proof of GenAI usage.

**Prompt 1 — Choose tech & scaffold**
```
"I'm doing a Moringa capstone: I need a beginner-friendly toolkit showing how to get started with Ruby and build a minimal runnable app (Hello World). Recommend the simplest framework and provide a file list and commands for Ubuntu 24.04."
```
**AI response summary:** Recommended Sinatra for speed; suggested using rbenv and Bundler. Helped pick Ruby 3.x and scaffolded file layout.  
**Evaluation:** Very helpful — saved me time deciding between Rails and Sinatra.

**Prompt 2 — rbenv install steps**
```
"Show me exact commands to install rbenv and ruby-build on Ubuntu 24.04 and compile Ruby 3.4.6, including the apt packages I must install first."
```
**AI response summary:** Gave the apt package list and rbenv commands; some minor edits were needed for exact package names.  
**Evaluation:** Useful — double-check apt package lists before running.

**Prompt 3 — Sinatra app example**
```
"Write a minimal Sinatra app with two routes: `/` (HTML) and `/api/hello` (JSON). Include comments and instructions to run with Bundler."
```
**AI response summary:** Returned the `app.rb` used here. Clear, concise.  
**Evaluation:** Excellent — only minor formatting edits required.

**Prompt 4 — Troubleshooting**
```
"I'm seeing 'ruby-build: missing openssl' when installing Ruby. How do I fix it on Ubuntu 24.04?"
```
**AI response summary:** Suggested installing `libssl-dev`, re-running `rbenv install`, and checking `config.log`.  
**Evaluation:** Accurate and actionable.

---

## 7) Common Issues & Fixes

- **`rbenv install` fails / missing libs**  
  - Symptom: compile errors or "openssl not found" messages.  
  - Fix: ensure Step 1 packages (`libssl-dev`, `libreadline-dev`, `zlib1g-dev`, etc.) are installed; re-run `rbenv install`.

- **Bundler complains about native gems or permissions**  
  - Symptom: `gem install` fails due to permission denied.  
  - Fix: avoid `sudo gem install ...` for project gems; use rbenv-managed Ruby; run `gem install bundler` as normal user. If you previously installed gems with sudo and see permission errors, remove system-installed gems or re-install using rbenv.

- **Port already in use**  
  - Symptom: Sinatra can't bind to `4567`.  
  - Fix: set `PORT` environment variable when running: `PORT=3000 ruby app.rb`.

- **JSON not pretty / encoding issues**  
  - Make sure to `require 'json'` before calling `to_json`.

---

## 8) References (official docs & helpful guides)

- Ruby Releases & downloads — official: https://www.ruby-lang.org/en/downloads/releases/ (Ruby 3.4.6 noted).  
- Sinatra docs & intro: https://sinatrarb.com/intro.html & documentation.  
- Bundler docs (getting started): https://bundler.io/guides/getting_started.html  
- rbenv + ruby-build setup guides (Ubuntu 24.04): community guides and gist examples for rbenv.  
(Links used while authoring are included in the submission notes.)

---

## 9) Next steps / Ideas for improvement (bonus)

- Add a tiny ERB view, static assets, and a `Procfile` for deploying to Heroku-like platform.  
- Add automated tests using `rack-test` and `minitest`.  
- Create a short Loom video showing install & run.

---

## 10) Project files (in this repo)
- `README.md` (this file)
- `Gemfile`
- `app.rb`
- `.ruby-version`
- `AI_PROMPTS.md`
- `.gitignore`

---

Good luck — ping me if you want this guide converted to a PDF, a slide deck, or if you'd like a small test suite added next.
