# Global agent config

Personal, machine-level config for Claude Code, kept in this repo so it travels to a new machine with a `git clone`.

| File | Lands at | What it does |
|---|---|---|
| `CLAUDE.md` | `~/.claude/CLAUDE.md` | Always-on instructions loaded into every session on this machine. |
| (from the `writing-for-humans` skill) | `~/.claude/forbidden.md` | The list of AI writing tells that `CLAUDE.md` points at. |

Run `scripts/bootstrap-global.sh` to install them. It symlinks where the platform allows a file symlink, so a `git pull` keeps both files current. On Windows under Git Bash it copies instead, and says so; re-run it after pulling to refresh the copies.

`~/.claude/forbidden.md` is not stored here. Its source of truth is `skills/productivity/writing-for-humans/references/tells.md`, so the plugin and the global file can never drift apart.

An existing `~/.claude/CLAUDE.md` that is a real file gets backed up next to itself before it is replaced. Nothing is deleted.
