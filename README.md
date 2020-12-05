# Prepply
Easily monitor the status of employee onboarding requirements


# Functionality

## HR
* Can generate access code for employee requirement tracking
* Create templates per employee grade/type
* Can specify requirements to be submitted in person or online
* Can remind employees of requirements due date
* Can monitor the status of each requirements
* Can view submitted documents via pdf
* Can approve or confirm the digital documents submitted

## Employee/User
* Can monitor each requirements
* Can submit digital documents for requirements

# Tech Stack
* Docker and Docker Compose
* Phoenix API (Graphql)
* React
* Tailwind
* Nginx

# Server implementation checklist
- [ ] Create user accounts
- [ ] Create employee profile
- [ ] Create employee checklist
- [ ] List of employees with checklist
- [ ] Status of each checklist


User account
- id
- username
- password
- role

Employee Profile
- profile_id
- user_id
- name
- mobile number

Employee checklist
- id
- profile_id
- item_id
- file path
- status

Checklist Items
- name
- description
- is online submit

checklist_template
- id
- name

checklist
- id
- template_id
- item_id

