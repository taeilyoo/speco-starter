#!/bin/bash

# Claude Code 스타터 패키지 설치 스크립트
# UI/UX 디자인 및 서비스 기획 최적화

set -e

# 색상 정의
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 로고 출력
echo -e "${BLUE}"
cat << "EOF"
   ____                          ____  _             _            
  / ___| _ __   ___  ___ ___    / ___|| |_ __ _ _ __| |_ ___ _ __ 
  \___ \| '_ \ / _ \/ __/ _ \   \___ \| __/ _` | '__| __/ _ \ '__|
   ___) | |_) |  __/ (_| (_) |   ___) | || (_| | |  | ||  __/ |   
  |____/| .__/ \___|\___\___/   |____/ \__\__,_|_|   \__\___|_|   
        |_|                                                       
         
         UI/UX 디자인 & 서비스 기획 스타터 패키지 v2.0
EOF
echo -e "${NC}"

# 기본 경로
CLAUDE_DIR="$HOME/.claude"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 함수: 메시지 출력
print_step() {
    echo -e "${BLUE}[*]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

# 함수: 디렉토리 생성
create_directories() {
    print_step "디렉토리 생성 중..."
    
    mkdir -p "$CLAUDE_DIR/skills"
    mkdir -p "$CLAUDE_DIR/commands"
    mkdir -p "$CLAUDE_DIR/subagents"
    mkdir -p "$CLAUDE_DIR/rules"
    
    print_success "디렉토리 생성 완료"
}

# 함수: 백업
backup_existing() {
    if [ -d "$CLAUDE_DIR/skills" ] && [ "$(ls -A $CLAUDE_DIR/skills 2>/dev/null)" ]; then
        print_warning "기존 skills 파일 발견"
        BACKUP_DIR="$CLAUDE_DIR/backup_$(date +%Y%m%d_%H%M%S)"
        mkdir -p "$BACKUP_DIR"
        cp -r "$CLAUDE_DIR/skills" "$BACKUP_DIR/" 2>/dev/null || true
        cp -r "$CLAUDE_DIR/commands" "$BACKUP_DIR/" 2>/dev/null || true
        cp -r "$CLAUDE_DIR/subagents" "$BACKUP_DIR/" 2>/dev/null || true
        print_success "기존 파일 백업 완료: $BACKUP_DIR"
    fi
}

# 함수: Skills 복사
copy_skills() {
    print_step "Skills 파일 복사 중..."
    
    if [ -d "$SCRIPT_DIR/skills" ]; then
        cp -r "$SCRIPT_DIR/skills/"* "$CLAUDE_DIR/skills/"
        SKILL_COUNT=$(ls -1 "$CLAUDE_DIR/skills" | wc -l)
        print_success "Skills $SKILL_COUNT개 설치 완료"
    else
        print_error "skills 폴더를 찾을 수 없습니다"
        exit 1
    fi
}

# 함수: Commands 복사
copy_commands() {
    print_step "Commands 파일 복사 중..."
    
    if [ -d "$SCRIPT_DIR/commands" ]; then
        cp -r "$SCRIPT_DIR/commands/"* "$CLAUDE_DIR/commands/"
        CMD_COUNT=$(ls -1 "$CLAUDE_DIR/commands" | wc -l)
        print_success "Commands $CMD_COUNT개 설치 완료"
    else
        print_error "commands 폴더를 찾을 수 없습니다"
        exit 1
    fi
}

# 함수: Subagents 복사
copy_subagents() {
    print_step "Subagents 파일 복사 중..."
    
    if [ -d "$SCRIPT_DIR/subagents" ]; then
        cp -r "$SCRIPT_DIR/subagents/"* "$CLAUDE_DIR/subagents/"
        AGENT_COUNT=$(ls -1 "$CLAUDE_DIR/subagents" | wc -l)
        print_success "Subagents $AGENT_COUNT개 설치 완료"
    else
        print_error "subagents 폴더를 찾을 수 없습니다"
        exit 1
    fi
}

# 함수: Rules 복사
copy_rules() {
    print_step "Rules 파일 복사 중..."
    
    if [ -d "$SCRIPT_DIR/rules" ]; then
        cp -r "$SCRIPT_DIR/rules/"* "$CLAUDE_DIR/rules/"
        RULE_COUNT=$(ls -1 "$CLAUDE_DIR/rules" | wc -l)
        print_success "Rules $RULE_COUNT개 설치 완료"
    else
        print_warning "rules 폴더를 찾을 수 없습니다 (선택 사항)"
    fi
}

# 함수: Hooks 안내
show_hooks_guide() {
    print_step "Hooks 설정 안내"
    echo ""
    echo -e "${YELLOW}Hooks 설정은 수동으로 병합해야 합니다:${NC}"
    echo ""
    echo "  1. hooks/hooks-config.json 파일을 확인하세요"
    echo "  2. 필요한 설정을 ~/.claude/settings.json에 추가하세요"
    echo ""
    echo -e "${BLUE}예시:${NC}"
    echo '  "hooks": {'
    echo '    "PreToolUse": [...],'
    echo '    "PostToolUse": [...],'
    echo '    "Stop": [...]'
    echo '  }'
    echo ""
}

# 함수: 설치 요약
show_summary() {
    echo ""
    echo -e "${GREEN}============================================${NC}"
    echo -e "${GREEN}       설치가 완료되었습니다!${NC}"
    echo -e "${GREEN}============================================${NC}"
    echo ""
    echo -e "${BLUE}설치 위치:${NC} $CLAUDE_DIR"
    echo ""
    echo -e "${BLUE}설치된 항목:${NC}"
    echo "  • Skills:    $(ls -1 $CLAUDE_DIR/skills 2>/dev/null | wc -l)개"
    echo "  • Commands:  $(ls -1 $CLAUDE_DIR/commands 2>/dev/null | wc -l)개"
    echo "  • Subagents: $(ls -1 $CLAUDE_DIR/subagents 2>/dev/null | wc -l)개"
    echo "  • Rules:     $(ls -1 $CLAUDE_DIR/rules 2>/dev/null | wc -l)개"
    echo ""
    echo -e "${BLUE}사용 가능한 Commands:${NC}"
    echo "  UI/UX:  /design-review, /flow-check, /wireframe, /a11y-audit"
    echo "  기획:   /spec-generate"
    echo "  개발:   /tdd, /e2e, /test-coverage, /security-audit, /refactor-clean"
    echo ""
    echo -e "${YELLOW}다음 단계:${NC}"
    echo "  1. Claude Code를 재시작하세요"
    echo "  2. /design-review 등의 명령을 사용해보세요"
    echo "  3. 필요에 따라 skills/*.md 파일을 커스터마이징하세요"
    echo ""
}

# 함수: 도움말
show_help() {
    echo "사용법: ./install.sh [옵션]"
    echo ""
    echo "옵션:"
    echo "  -h, --help     도움말 표시"
    echo "  -b, --backup   기존 파일 백업만 수행"
    echo "  -s, --skills   Skills만 설치"
    echo "  -c, --commands Commands만 설치"
    echo "  -a, --agents   Subagents만 설치"
    echo "  --no-backup    백업 없이 설치"
    echo ""
    echo "예시:"
    echo "  ./install.sh           # 전체 설치 (기본)"
    echo "  ./install.sh -s        # Skills만 설치"
    echo "  ./install.sh --no-backup  # 백업 없이 설치"
    echo ""
}

# 메인 로직
main() {
    local DO_BACKUP=true
    local INSTALL_SKILLS=true
    local INSTALL_COMMANDS=true
    local INSTALL_AGENTS=true
    
    # 인자 처리
    while [[ $# -gt 0 ]]; do
        case $1 in
            -h|--help)
                show_help
                exit 0
                ;;
            -b|--backup)
                backup_existing
                exit 0
                ;;
            -s|--skills)
                INSTALL_COMMANDS=false
                INSTALL_AGENTS=false
                shift
                ;;
            -c|--commands)
                INSTALL_SKILLS=false
                INSTALL_AGENTS=false
                shift
                ;;
            -a|--agents)
                INSTALL_SKILLS=false
                INSTALL_COMMANDS=false
                shift
                ;;
            --no-backup)
                DO_BACKUP=false
                shift
                ;;
            *)
                print_error "알 수 없는 옵션: $1"
                show_help
                exit 1
                ;;
        esac
    done
    
    echo ""
    print_step "Speco-Starter 설치를 시작합니다..."
    echo ""
    
    # 백업
    if [ "$DO_BACKUP" = true ]; then
        backup_existing
    fi
    
    # 디렉토리 생성
    create_directories
    
    # 파일 복사
    if [ "$INSTALL_SKILLS" = true ]; then
        copy_skills
    fi
    
    if [ "$INSTALL_COMMANDS" = true ]; then
        copy_commands
    fi
    
    if [ "$INSTALL_AGENTS" = true ]; then
        copy_subagents
    fi
    
    # Rules는 항상 복사
    copy_rules
    
    # Hooks 안내
    show_hooks_guide
    
    # 요약
    show_summary
}

# 실행
main "$@"
