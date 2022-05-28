# study-terraform

## AWS Profile

AWS Key를 공개하는 것은 위험이 따르기 때문에, `~/.aws/credentails` 디렉토리에 다음과 같이 Profile을 만들어 주도록 한다.  
추후에는 `secrets` 파일을 만드는게 더 바람직할 것으로 보인다.

```
[sample-profile]
aws_access_key_id = <YOUR-AWS-ACCESS-KEY>
aws_secret_access_key = <YOUR-AWS-SECRET-ACCESS-KEY>
```
