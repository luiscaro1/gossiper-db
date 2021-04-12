#!/bin/bash
psql -U postgres -d gossiper:1.0-db -f Schema.sql
