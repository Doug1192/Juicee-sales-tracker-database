create table staff (
  id uuid default gen_random_uuid() primary key,
  name text not null unique,
  role text not null default 'salesrep',
  pin text,
  pin_set boolean default false,
  created_at timestamp default now()
);

create table leaders (
  id uuid default gen_random_uuid() primary key,
  name text not null unique,
  pin text,
  pin_set boolean default false,
  created_at timestamp default now()
);

create table shops (
  id uuid default gen_random_uuid() primary key,
  name text not null unique,
  created_at timestamp default now()
);

create table entries (
  id uuid default gen_random_uuid() primary key,
  staff_id uuid references staff(id),
  employee_name text,
  leader_name text,
  shop_name text,
  leader_id uuid,
  shop_id uuid,
  date date not null,
  stops integer default 0,
  tabs integer default 0,
  cl integer default 0,
  cs_customers integer default 0,
  cs_products integer default 0,
  sale_value integer,
  entered_by text,
  entered_role text,
  edited_by text,
  edited_at timestamp,
  created_at timestamp default now()
);

alter table staff enable row level security;
alter table leaders enable row level security;
alter table shops enable row level security;
alter table entries enable row level security;

create policy "open" on staff for all using (true) with check (true);
create policy "open" on leaders for all using (true) with check (true);
create policy "open" on shops for all using (true) with check (true);
create policy "open" on entries for all using (true) with check (true);
