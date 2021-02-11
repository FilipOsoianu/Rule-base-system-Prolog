FROM swipl
COPY . /
CMD ["swipl", "turist_expert_system.pl"]