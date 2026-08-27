#!/usr/bin/env bash
set -euo pipefail

repo_name="${1:-Track1_Day25_[Điền_Mã_Học_Viên]_LuongThanhTrang}"
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "$repo_name" = /* ]]; then
  repo_dir="$repo_name"
else
  repo_dir="$script_dir/$repo_name"
fi

mkdir -p "$repo_dir"

if [[ ! -d "$repo_dir/.git" ]]; then
  git -C "$repo_dir" init
fi

cat > "$repo_dir/README.md" <<'README'
# Lab Day 25: Từ sản phẩm chạy được đến sản phẩm bán được

**Chủ đề:** AI Pricing · GTM · Evidence<br>
**Học viên:** Luong Thanh Trang<br>
**Mã học viên:** [Điền mã học viên]

## Artifacts

- `Trang_Day25_model.xlsx`: mô hình định giá gồm 5 tab.
- `Trang_Day25_onepager.pdf`: Monetization One-Pager.

## Self-Evaluation Checklist

Đánh dấu `[x]` và điền bằng chứng/link trước khi nộp. Điểm tối đa: **100 điểm**.

| Đã kiểm tra | Tiêu chí / điểm | Checklist bắt buộc | Bằng chứng, số liệu hoặc link |
|---|---|---|---|
| [ ] | **1. Cost/Job Rigor (30đ)** | [ ] Đủ 5 thành phần: **API, Infra, HITL, Retry, Overhead**.<br>[ ] Mẫu số là **job hoàn thành**.<br>[ ] Có **breakeven containment**.<br>[ ] Có ngày kiểm tra giá API. | Giá API ngày: `____`<br>Cost/job: `____`<br>Breakeven containment: `____`<br>Link/bảng tính: `____` |
| [ ] | **2. Value Metric Justification (25đ)** | [ ] Có ma trận **Attribution × Autonomy**.<br>[ ] Chốt **đơn vị tính tiền**.<br>[ ] Có **2 benchmark thực tế kèm link**. | Ma trận: `____`<br>Đơn vị: `____`<br>Benchmark 1 + link: `____`<br>Benchmark 2 + link: `____` |
| [ ] | **3. Channel Evidence (20đ)** | [ ] Chốt đúng **1 kênh**.<br>[ ] Có tính **ngân sách CAC**.<br>[ ] Nếu Partner-Led, có **tên công ty cụ thể**. | Kênh: `____`<br>Ngân sách CAC: `____`<br>Công thức: `____`<br>Partner (nếu có): `____` |
| [ ] | **4. Pain Moment & 90-Day Plan (15đ)** | [ ] Pain Moment đủ **giờ + việc + app**.<br>[ ] Có **điểm nhúng cụ thể**.<br>[ ] Plan 90 ngày có **số liệu** và **người phụ trách**. | Giờ / việc / app: `____`<br>Điểm nhúng: `____`<br>Ngày 1-30 / số liệu / owner: `____`<br>Ngày 31-60 / số liệu / owner: `____`<br>Ngày 61-90 / số liệu / owner: `____` |
| [ ] | **5. Evidence Pack Readiness (10đ)** | [ ] Có **3 tài sản bằng chứng**.<br>[ ] Mỗi tài sản có nội dung cụ thể hoặc deadline rõ ràng. | 1. `____` / nội dung-deadline: `____`<br>2. `____` / nội dung-deadline: `____`<br>3. `____` / nội dung-deadline: `____` |

## Evidence Pack

| Tài sản | Nội dung cụ thể hoặc deadline | Vị trí/link |
|---|---|---|
| 1. Model định giá | `____` | `Trang_Day25_model.xlsx` |
| 2. Monetization One-Pager | `____` | `Trang_Day25_onepager.pdf` |
| 3. [Tên tài sản bổ sung] | `____` | `____` |
README

touch "$repo_dir/Trang_Day25_model.xlsx" "$repo_dir/Trang_Day25_onepager.pdf"

printf 'Repository initialized at %s\n' "$repo_dir"