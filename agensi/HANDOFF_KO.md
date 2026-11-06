# Drive MCP Local — Agensi 스킬 패키지 인계 메모

작성: Cloud Agent (2026-11-06)  
대상: 진욱 (소유자)

## 이번에 만든 것

| 구분 | 위치 |
| --- | --- |
| Agensi 업로드용 ZIP | `dist/drive-mcp-local-workflows-agensi.zip` (빌드 후), `/opt/cursor/artifacts/` 복사본 |
| 스킬 본문 | `agensi/drive-mcp-local-workflows/SKILL.md` |
| 영문 마켓플레이스 카피 | `agensi/MARKETPLACE_LISTING.md` |
| 패키지 검증 스크립트 | `agensi/scripts/validate-package.sh` |

**ZIP 안에는** 에이전트용 SKILL.md, reference, templates, 예시 설정(플레이스홀더)만 들어 있습니다.  
**ZIP 밖(레포)** 에는 마켓 카피, 빌드/검증 스크립트, 기존 `PRIVACY.md`가 있습니다.

## 레포 현황 (중요)

현재 GitHub 레포 `jinukahn98-lab/drive-mcp-privacy`에는 **README + PRIVACY.md만** 있고, **Drive MCP Local MCP 서버 소스는 이 레포에 없습니다.**  
스킬은 “로컬 MCP를 이미 쓰는 사람을 위한 운영 지침”으로 작성했으며, MCP 바이너리/ npm 패키지는 **별도 배포** 전제입니다.

## 업로드 전 소유자 결정 사항

1. **MCP 서버 공개 URL**  
   - Agensi listing과 `reference/prerequisites.md`에 넣을 **공식 설치 문서/저장소 URL**을 정해 주세요.  
   - 아직 비공개면: listing에 “별도 설치 필요, 문의: 이메일”처럼 명시하거나, MCP 공개 후 스킬 v1.1을 올리는 편이 리뷰에 유리합니다.

2. **라이선스 / 재배포**  
   - 스킬 텍스트: `LICENSE.txt` (판매자 저작, Agensi 경로 외 재배포 금지 명시).  
   - MCP 서버가 오픈소스 포크(예: 타인 Google Drive MCP)라면 **그 프로젝트 LICENSE**와 Agensi “오리지널 작업” 규정이 충돌하지 않는지 직접 확인 필요. **이 패키지는 MCP 코드를 포함하지 않습니다.**

3. **OAuth 앱**  
   - `PRIVACY.md`는 **소유자 개인 OAuth 앱** 기준입니다.  
   - Agensi **구매자**는 각자 Google Cloud 프로젝트·OAuth 클라이언트를 만들어야 합니다. listing/security 문구는 그 전제를 반영했습니다.

4. **가격 모델**  
   - 일회성 vs 구독: MCP 릴리스마다 스킬을 맞출 계획이 없으면 **일회성** 권장 (`MARKETPLACE_LISTING.md` 참고).

5. **Agensi 계정 / KYC / Stripe**  
   - 유료 listing 전 **본인이** Agensi에서 payout 연결 및 KYC 완료 필요 (에이전트는 가입·업로드하지 않음).

6. **스킬 이름 고유성**  
   - Agensi `name`: `drive-mcp-local-workflows` — 플랫폼에 동명 스킬이 있으면 업로드 시 거절될 수 있어, 필요 시 `name`과 폴더명을 함께 변경 후 ZIP 재빌드.

## 검증 요약

`agensi/scripts/validate-package.sh` 실행 결과를 PR/아티팩트에 기록했습니다.  
수동으로 **Cursor 등 MCP 클라이언트 + 실제 Drive MCP Local**에 연결해 한두 가지 시나리오(검색 → 읽기 → 수정 → 검증)를 돌려 보는 것은 **소유자 환경에서만** 가능합니다 (이 클라우드 환경에는 MCP 서버 없음).

## 하지 않은 것 (의도적)

- Agensi 회원가입, ZIP 업로드, 가격/세금/KYC 설정
- Google Cloud / OAuth 앱 변경
- MCP 서버 코드 공개 또는 수정

## PR

브랜치 `cursor/agensi-drive-mcp-skill-fbda` — 머지 후에도 `dist/*.zip`은 CI에 없을 수 있으므로, 업로드 직전 로컬에서 `build-submission-zip.sh` 재실행을 권장합니다.
