configfile: "config.yaml"

with open(config['SAMPLES']) as fp:
    SAMPLES= fp.read().splitlines()
print(SAMPLES)

rule all:
   input:
        expand("{sample}_lncRNA_pos_seq_desc", sample = SAMPLES)

if config['PAIRED']:
    rule tofasta:
       input:
           r1 = "{sample}.r_1.fq.gz",
           r2 = "{sample}.r_2.fq.gz"
       output:
           "{sample}.fasta",
       shell:
           """
           reformat.sh in={input.r1} in2={input.r2} out={output}
           """
else: 
   rule tofasta:
       input:
          "{sample}.fq.gz",
       output:
           "{sample}.fasta",
       shell:
           """
           reformat.sh in={input} out={output}
           """

    
rule PLEK:
   input:
        "{sample}.fasta"
   params: 
     prefix = "{sample}_lncRNA"
   output:
       "{sample}_lncRNA_pos_seq_desc"
   conda: 'env/env-plek.yaml' 
   shell:
      """
      PLEK -f {input} -o {params.prefix} 
      """

