# Juicee!! — Sales Tracking Database

> A real-time, role-based sales performance tracking system built for the Infinite Reach direct sales team.

**Live app:** [juicee20.netlify.app](https://juicee20.netlify.app)

---

## Overview

Infinite Reach operated without a centralized data system. Performance feedback was anecdotal, staffing decisions were based on gut feel, and there was no way to objectively compare reps, shops, or leaders over time.

**Juicee!!** replaces informal verbal reporting with a live shared database that every team member accesses from their phone or browser. Sales Reps log daily stats in under a minute. Managers get real-time dashboards, leaderboards, and exportable reports — no spreadsheets, no manual compilation.

---

## Features

### For Sales Reps
- Log daily stats: Stops, Tabs, Closing Line, Customer Service (CS), and Sale Value ($)
- PIN-protected personal login with self-service first-time setup
- View own performance across multiple timeframes
- Access the **High Rollers** leaderboard (top 5 by products sold)

### For Leaders
- View all staff stats and performance trends
- Access Top Shops and Top Leaders rankings
- Export data to Excel
- View-only access — cannot edit entries

### For Managers & Super Admins
- Full access to all data and dashboards
- Add and remove Sales Reps, Leaders, and Shops
- Edit saved entries with full audit trail (who edited, when)
- Head-to-head rep comparison with visual win/loss bars
- Multi-timeframe analytics: daily, weekly, bi-weekly, monthly, quarterly, annual, custom
- Export entries, top shops, and top leaders to Excel (.xlsx)

---

## Metrics Tracked

| Metric | Description |
|---|---|
| **Stops** | Total customers approached |
| **Tabs** | Customers whose info was recorded (≤ Stops) |
| **Closing Line (CL)** | Customers who agreed to a product (≤ Tabs) |
| **Customer Service (CS)** | Actual sales in Customers–Products format e.g. 2–3 (≤ CL) |
| **Sale Value ($)** | Total dollar value of sales that day (integer, optional) |

Built-in validation prevents any metric from exceeding the one above it in the funnel.

---

## Tech Stack

| Layer | Technology |
|---|---|
| Frontend | HTML, CSS, Vanilla JavaScript |
| Database | Supabase (PostgreSQL) |
| Hosting | Netlify |
| Export | SheetJS (xlsx) |
| Icons | Tabler Icons |

No frameworks. No build tools. Single `index.html` file — deployable in seconds via Netlify drag and drop.

---

## Database Schema

```sql
-- Staff (Sales Reps and Leaders)
staff (id, name, role, pin, pin_set, created_at)

-- Leaders list
leaders (id, name, pin, pin_set, created_at)

-- Shop locations
shops (id, name, created_at)

-- Daily entries
entries (
  id, staff_id, employee_name, leader_name, shop_name,
  date, stops, tabs, cl, cs_customers, cs_products, sale_value,
  entered_by, entered_role, edited_by, edited_at, created_at
)
```

---

## Key Design Decisions

- **Frontend-only architecture** — all role logic and PIN validation runs in the browser, keeping the stack simple and the deployment instant
- **Audit trail on every edit** — edited entries record the editor's name and timestamp alongside the original, ensuring full data accountability
- **Supabase REST API** — direct fetch calls from the browser, no backend server required
- **Self-set PINs** — Sales Reps and Leaders set their own PIN on first login, reducing manager admin overhead
- **Local timezone date handling** — date defaults always reflect the user's local time, not UTC

---

## Tech Stack

| Layer | Technology |
|---|---|
| Frontend | HTML, CSS, Vanilla JavaScript |
| Database | Supabase (PostgreSQL) |
| Hosting | Netlify |
| Export | SheetJS (xlsx) |
| Icons | Tabler Icons |

No frameworks. No build tools. Single `index.html` file — deployable in seconds via Netlify drag and drop.

---

## Database Schema

```sql
-- Staff (Sales Reps and Leaders)
staff (id, name, role, pin, pin_set, created_at)

-- Leaders list
leaders (id, name, pin, pin_set, created_at)

-- Shop locations
shops (id, name, created_at)

-- Daily entries
entries (
  id, staff_id, employee_name, leader_name, shop_name,
  date, stops, tabs, cl, cs_customers, cs_products, sale_value,
  entered_by, entered_role, edited_by, edited_at, created_at
)
```

---

## Key Design Decisions

- **Frontend-only architecture** — all role logic and PIN validation runs in the browser, keeping the stack simple and the deployment instant
- **Audit trail on every edit** — edited entries record the editor's name and timestamp alongside the original, ensuring full data accountability
- **Supabase REST API** — direct fetch calls from the browser, no backend server required
- **Self-set PINs** — Sales Reps and Leaders set their own PIN on first login, reducing manager admin overhead
- **Local timezone date handling** — date defaults always reflect the user's local time, not UTC

---

## Screenshots

> Sales Rep login → name dropdown + PIN setup on first visit

> Log entry form with real-time validation

> High Rollers bar chart — top 5 by products sold, selectable timeframe

> Head-to-head comparison — green for winner, red for loser

> Manager dashboard — top shops and top leaders leaderboards

---

## What This Solved

| Before Juicee!! | After Juicee!! |
|---|---|
| Verbal end-of-day reports | Real-time database updated daily |
| No visibility into conversion rates | Tab rate, CL rate, close rate per rep |
| Gut-feel staffing decisions | Top shops leaderboard drives deployment |
| Subjective performance reviews | Head-to-head comparison with actual numbers |
| No historical records | Full exportable entry history with audit trail |

---