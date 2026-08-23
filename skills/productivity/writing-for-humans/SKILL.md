---
name: writing-for-humans
description: "Strip the tells that mark writing as AI-generated. Use when producing or editing prose a human reads as writing: posts, emails, docs, announcements, marketing copy, README prose, summaries, or when the user says the draft sounds like AI, sounds generic, or asks to make it sound human."
---

# Writing for humans

Prose a human reads as writing carries a set of tells that mark it as machine-written. They are structural, not stylistic, so they survive a normal editing pass. This skill exists to catch them.

This is the human-facing counterpart to `writing-for-agents`. That one is about documents an agent consumes. This one is about anything a person reads and judges.

## The loop

1. Draft normally. Do not try to write around the list while drafting; you will produce stilted prose.
2. Read `references/tells.md`. It is short.
3. Pass over the draft once per tell. Each one has a fix attached, so apply the fix rather than deleting the sentence and hoping.
4. Deliver. Do not list the tells you found or narrate the edit unless the user asks.

## What the tells have in common

Every one of them is a **shape the reader has seen too many times**, not a wrong statement. A sentence can be true, accurate, and well-punctuated, and still land as machine output because of its shape. That is why "make it better" does not fix any of them and a named list does.

Two of them are worth extra attention, because they hide inside genuinely good writing:

- **The rule of three.** A real argument has however many reasons it has. Three is the number that turns up when the writer is filling a shape rather than counting.
- **The self-congratulating aside.** "Which is exactly the point" tells the reader how to feel about the sentence before it. Deleting it costs nothing.

## Applies to

Posts, emails, announcements, marketing copy, documentation prose, PR and commit bodies, release notes, summaries written for a person, and any user-facing string. It does not apply to code, code comments, structured data, or documents written for agents.

## Reference

- `references/tells.md`: the list, with the fix for each tell.
