nuclei --update-templates --silent

if [ ! -f url.txt ]; then
        echo "create url.txt"
else
        if [ ! -d results ]; then
                mkdir results
        fi
        echo "Running CVEs"
        nuclei -l url.txt -t cves/ -no-interactsh -o results/cves.txt
        echo "Running exposures"
        nuclei -l url.txt -t exposures/ -no-interactsh -o results/exposures.txt
        echo "Running misconfigs"
        nuclei -l url.txt -t misconfiguraations/ -no-interactsh -o results/misconfigurations.txt
        echo "Running Takeovers"
        nuclei -l url.txt -t takeovers/ -no-interactsh -o results/takeovers.txt
        echo "Running Vulns"
        nuclei -l url.txt -t vulnerabilities/ -no-interactsh -o results/vulnerabilities.txt
        echo "Running Exposed Panels"
        nuclei -l url.txt -t exposed-panels/ -no-interactsh -o results/exposed-panels.txt
        echo "Running Files"
        nuclei -l url.txt -t file/ -no-interactsh -o results/file.txt
        
fi    
    
