$ORIGIN example.nl.
$TTL 3600
@ IN SOA ns1.example.nl. hostmaster.example.nl. (
    640 ; serial
    14400; refresh (4 hours)
    3600; retry (1 hour)
    604800; expire (1 week)
    300; minimum (5 minutes)
)
@ IN NS ns1.example.nl.
@ IN A 127.0.0.1
@ IN AAAA ::1
@ IN TXT "This is a simulated example.nl"
www IN A 127.0.0.1
www IN AAAA ::1
