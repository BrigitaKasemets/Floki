-- Purpose: Update the location column in the Plant table to be nullable if not specified.
ALTER TABLE Plant
    MODIFY COLUMN location VARCHAR(191) NULL;