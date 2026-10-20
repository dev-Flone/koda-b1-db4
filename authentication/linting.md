# ERD Authentication
``` mermaid
erDiagram
    direction TB    

    USERS ||--o{ ACCOUNTS: "memiliki"
    ACCOUNTS ||--o{ SESSIONS: "memiliki"
    ACCOUNTS }|--|{ ROLES: "memiliki"

    USERS {
        int id PK
        string name
    }

    ACCOUNTS {
        int id PK
        int account_id FK
        string email
        string username
        string password_hash
        date created_at
    }

    SESSIONS {
        int id PK
        int session_id FK
        string session_token
        date created_at
        date expires_at
    }

    ROLES {
        int id PK
        int role_id FK
        string role_name
    }
```